import 'package:apps_kurir/app/modules/beranda/views/beranda_view.dart';
import 'package:apps_kurir/app/modules/listResi/views/scanBarcode.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../beranda/controllers/beranda_controller.dart';
import '../controllers/list_resi_controller.dart';

class ListResiView extends GetView<ListResiController> {
  const ListResiView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final berandaController = Get.put(BerandaController());
    final dynamic arguments = Get.arguments;
    final String name = arguments['name'];
    final String agenId = arguments['agen'];
    final String kurirId = arguments['kurir'];
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => Get.to(ScanBarcodeView(
                name: name,
                agen: int.parse(agenId),
                kurir: int.parse(kurirId))),
            icon: const Icon(Icons.qr_code),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GetBuilder<ListResiController>(builder: (controller) {
                  if (controller.scannedCodes.isEmpty) {
                    return const Text(
                      'Total Resi: 0',
                      style: TextStyle(fontSize: 20),
                    );
                  } else {
                    return Text(
                      'Total Resi: ${controller.scannedCodes.length}',
                      style: const TextStyle(fontSize: 20),
                    );
                  }
                }),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Map<String, int> logisticCount =
                        controller.calculateLogisticCount();
                    // Get.find<ListResiController>().sendDataToAPI();
                    _showManifest(context, logisticCount);
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'List Resi',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: WillPopScope(
              onWillPop: () async {
                // Tampilkan konfirmasi
                bool exitConfirmed = await showExitConfirmationDialog();

                // Jika pengguna menekan "Yes" pada konfirmasi, kembalikan true
                // sehingga navigasi akan dilakukan
                return exitConfirmed;
              },
              child: GetBuilder<ListResiController>(
                builder: (controller) {
                  if (controller.scannedCodes.isEmpty) {
                    return const Center(
                      child: Text(
                        'Belum ada resi',
                        style: TextStyle(fontSize: 18),
                      ),
                    );
                  } else {
                    return _buildListView();
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListView() {
    return ListView.builder(
      itemCount: controller.scannedCodes.length,
      itemBuilder: (context, index) {
        final items = controller.scannedCodes[index];
        return ListTile(
          title: Text(items.code, style: TextStyle(color: Colors.black),),
          subtitle: Text('${items.logistic},${items.warehouse}', style: TextStyle(color: Colors.black),),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              // Panggil metode untuk menghapus data berdasarkan index
              controller.deleteScannedCode(index);
            },
          ),
        );
      },
    );
  }
}

void _showManifest(BuildContext context, Map<String, int> logisticCount) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Manifest', style: TextStyle(color: Colors.black),),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (String logistic in logisticCount.keys)
              Text('$logistic: ${logisticCount[logistic]}', style: const TextStyle(color: Colors.black),),
            const SizedBox(height: 16),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Get.find<ListResiController>().sendDataToAPI();
              Navigator.pop(context);
              Get.off(const BerandaView());
            },
            child: const Text('OK'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Batal'),
          ),
        ],
      );
    },
  );
}

Future<bool> showExitConfirmationDialog() async {
  return await showDialog(
    context: Get.context!,
    builder: (context) {
      return AlertDialog(
        title: const Text('Keluar dari Aplikasi?', style: TextStyle(color: Colors.black),),
        content: const Text('Apakah Anda yakin ingin keluar dari aplikasi?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true); // Navigasi akan dilakukan
            },
            child: const Text('Ya', style: TextStyle(color: Colors.black),),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false); // Tetap berada di halaman saat ini
            },
            child: const Text('Tidak', style: TextStyle(color: Colors.black)),
          ),
        ],
      );
    },
  );
}
