import 'dart:async';
import 'dart:io';

import 'package:apps_kurir/app/modules/listResi/controllers/list_resi_controller.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanBarcodeView extends StatefulWidget {
  final String name;
  final int agen;
  final int kurir;

  const ScanBarcodeView(
      {required this.name, required this.agen, required this.kurir});
  @override
  _ScanBarcodeViewState createState() => _ScanBarcodeViewState();
}

class _ScanBarcodeViewState extends State<ScanBarcodeView> {
  final dynamic arguments = Get.arguments;
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  TextEditingController inputManual = TextEditingController();
  AudioPlayer audioPlayer = AudioPlayer();

  String getLogisticFromCode(String code) {
    if (code.startsWith('JP')) {
      return 'JNT';
    } else if (code.startsWith('SPX')) {
      return 'SPX';
    } else if (code.startsWith('JX')) {
      return 'JNT';
    } else if (code.startsWith('JB')) {
      return 'JNT';
    } else if (code.startsWith('JO')) {
      return 'JNT';
    } else if (code.startsWith('00')) {
      return 'Sicepat';
    } else if (code.startsWith('TLJ')) {
      return 'JNE';
    } else if (code.startsWith('LX')) {
      return 'Lazada';
    } else {
      return code.substring(0, 2);
    }
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan Resi'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(flex: 4, child: _buildQrView(context)),
          Expanded(
            flex: 1,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  if (result != null)
                    Text('Data: ${result!.code}')
                  else
                    const Text('Scan a code'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                            onPressed: () async {
                              await controller?.toggleFlash();
                              setState(() {});
                            },
                            child: FutureBuilder(
                              future: controller?.getFlashStatus(),
                              builder: (context, snapshot) {
                                return Text(
                                    'Flash: ${snapshot.data == true ? 'On' : 'Off'}');
                              },
                            )),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                            onPressed: () async {
                              await controller?.flipCamera();
                              setState(() {});
                            },
                            child: FutureBuilder(
                              future: controller?.getCameraInfo(),
                              builder: (context, snapshot) {
                                if (snapshot.data != null) {
                                  return Text(
                                      'Camera facing ${describeEnum(snapshot.data!)}');
                                } else {
                                  return const Text('loading');
                                }
                              },
                            )),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                          onPressed: () async {
                            await controller?.pauseCamera();
                          },
                          child: const Text('pause',
                              style: TextStyle(fontSize: 20)),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                          onPressed: () async {
                            await controller?.resumeCamera();
                          },
                          child: const Text('resume',
                              style: TextStyle(fontSize: 20)),
                        ),
                      ),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            _showInputDialog(context);
                          },
                          child: Text('Input Manual'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 500 ||
            MediaQuery.of(context).size.height < 500)
        ? 250.0
        : 500.0;
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      if (result != null) {
        String scannedCode = scanData.code!;
        String logistic = getLogisticFromCode(scannedCode);

        ListResiController listResiController = Get.find<ListResiController>();
        if (Get.find<ListResiController>()
            .isScannedCodeDuplicate(scannedCode)) {
          // Menampilkan pesan jika inputData sudah ada
          audioPlayer.setVolume(10.0);
          audioPlayer.play(AssetSource('Salah.mp3'));
          _showErrorToast();
        } else {
          if (!listResiController.scannedCodes.contains(scannedCode)) {
            Get.find<ListResiController>().addScannedCode(
                scannedCode, logistic, widget.name, widget.agen, widget.kurir);
            print('Kode huruf depan: $logistic');
            audioPlayer.setVolume(10.0);
            audioPlayer.play(AssetSource('notifacation.mp3'));
            controller.pauseCamera();
            Timer(Duration(seconds: 1), () {
              controller.resumeCamera();
            });
          } else {
            audioPlayer.setVolume(10.0);
            audioPlayer.play(AssetSource('Salah.mp3'));
            _showErrorToast();
            controller.pauseCamera();
            Timer(Duration(seconds: 1), () {
              controller.resumeCamera();
            });
          }
        }
      }
      setState(() {
        result = scanData;
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    // log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  void _showInputDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Input Resi Manual'),
          content: TextField(
            controller: inputManual,
            style: TextStyle(color: const Color.fromARGB(255, 53, 53, 53)),
            decoration: InputDecoration(hintText: 'Input Disini'),
          ),
          titleTextStyle: TextStyle(color: Colors.black),
          actions: [
            ElevatedButton(
              onPressed: () {
                // Lakukan sesuatu dengan data yang dimasukkan
                String inputData = inputManual.text.toUpperCase();
                String logistic = getLogisticFromCode(inputData);
                print('Kode huruf depan: $logistic');

                if (Get.find<ListResiController>()
                    .isScannedCodeDuplicate(inputData)) {
                  // Menampilkan pesan jika inputData sudah ada
                  audioPlayer.setVolume(10.0);
                  audioPlayer.play(AssetSource('Salah.mp3'));
                  _showErrorToast();
                } else {
                  // Menambahkan data jika belum ada
                  Get.find<ListResiController>().addScannedCode(inputData,
                      logistic, widget.name, widget.agen, widget.kurir);
                  audioPlayer.setVolume(10.0);
                  audioPlayer.play(AssetSource('notifacation.mp3'));
                  _showSuccessToast();
                  Navigator.pop(context);
                  inputManual.clear();
                }
              },
              child: Text('OK'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Menutup pop-up setelah tombol ditekan
              },
              child: Text('Batal'),
            ),
          ],
        );
      },
    );
  }

  void _showSuccessToast() {
    Fluttertoast.showToast(
      msg:
          'Berhasil di input!', // Pesan yang akan ditampilkan dalam notifikasi toast
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green, // Warna latar belakang notifikasi toast
      textColor: Colors.white, // Warna teks dalam notifikasi toast
      fontSize: 16.0,
    );
  }

  void _showErrorToast() {
    Fluttertoast.showToast(
      msg:
          'Resi sudah di input!', // Pesan yang akan ditampilkan dalam notifikasi toast
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor:
          Colors.redAccent, // Warna latar belakang notifikasi toast
      textColor: Colors.white, // Warna teks dalam notifikasi toast
      fontSize: 16.0,
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
