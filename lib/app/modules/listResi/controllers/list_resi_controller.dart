import 'dart:async';
import 'dart:convert';

import 'package:apps_kurir/app/modules/listResi/models/modelResi.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ListResiController extends GetxController {
  late QRViewController qrController;
  RxList<ScannedData> scannedCodes = <ScannedData>[].obs;
  bool canScanAgain = true;
  final scanInterval = const Duration(seconds: 5);

  bool isScannedCodeDuplicate(String code) {
    return scannedCodes.any((data) => data.code == code);
  }

  void addScannedCode(String code, String logistic, String warehouse, int agen, int kurir) {
    if (!scannedCodes.any((data) => data.code == code)) {
      scannedCodes.add(ScannedData(
        code: code,
        logistic: logistic,
        warehouse: warehouse,
        agen: agen,
        kurir: kurir,
      ));
    }
    update();
  }

  void deleteScannedCode(int index) {
    if (index >= 0 && index < scannedCodes.length) {
      scannedCodes.removeAt(index);
      update();
    }
  }

  Future<void> sendDataToAPI() async {
    // final cLogin = Get.find<CLogin>();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    String url = 'https://logisticrew.com/api/v1/resi';

    List<Map<String, dynamic>> dataToSend = scannedCodes.map((data) {
      return {
        'invoice':'-',
        'awb': data.code,
        'logistic': data.logistic,
        'warehouse': data.warehouse,
        'agen': data.agen,
        'kurir': data.kurir,
        'type': 0,
        'status': 1,
      };
    }).toList();

    try {
      print('${dataToSend},${token}');
      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode(dataToSend),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        print('Data berhasil disimpan ke database.');
        clearScannedCodes();
        CoolAlert.show(
          context: Get.context!,
          type: CoolAlertType.success,
          title: 'Sukses',
          text: 'Data berhasil disimpan.',
          textTextStyle: TextStyle(color: Colors.black),
        );
      } else {
        print('Gagal menyimpan data ke database. Status code: ${response.statusCode}');
        CoolAlert.show(
          context: Get.context!,
          type: CoolAlertType.error,
          title: 'Error',
          text: 'Gagal menyimpan data Status code: ${response.statusCode}',
          textTextStyle: TextStyle(color: Colors.black),
        );
      }
    } catch (error) {
      print('Terjadi kesalahan saat mengirim data: $error');
      CoolAlert.show(
        context: Get.context!,
        type: CoolAlertType.error,
        title: 'Error',
        text: 'Terjadi kesalahan saat mengirim data: $error',
      );
    }
  }

  Map<String, int> calculateLogisticCount() {
    Map<String, int> logisticCount = {};

    for (ScannedData data in scannedCodes) {
      if (logisticCount.containsKey(data.logistic)) {
        logisticCount[data.logistic] = logisticCount[data.logistic]! + 1;
      } else {
        logisticCount[data.logistic] = 1;
      }
    }

    return logisticCount;
  }

  void clearScannedCodes() {
    scannedCodes.clear();
    update();
  }

}
