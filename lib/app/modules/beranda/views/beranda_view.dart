import 'package:apps_kurir/app/modules/beranda/models/Warehouse.dart';
import 'package:apps_kurir/app/modules/home/controllers/cLogin.dart';
import 'package:apps_kurir/app/modules/listResi/views/list_resi_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../config/app_color.dart';
import '../controllers/beranda_controller.dart';

class BerandaView extends GetView<BerandaController> {
  const BerandaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final berandaController = Get.put(BerandaController());
    // final bController = Get.find<BerandaController>();
    final cLogin = Get.find<CLogin>();
    return Scaffold(
      // extendBody: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 11,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 200,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Obx(() {
                                    return Text(
                                      "Hallo, ${cLogin.user.value?.name}",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    );
                                  }),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    cLogin.user.value?.role == "4"
                                        ? 'Kurir Motorist'
                                        : 'Admin',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  controller.logout(context);
                                },
                                icon: const Icon(
                                  Icons.logout_rounded,
                                  size: 30,
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Rute kamu hari ini',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Warehouse>>(
              future: berandaController.getAllCustomer(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (!snapshot.hasData) {
                  return Center(
                    child: Text('Tidak punya data'),
                  );
                }
                print(snapshot.data);
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      Warehouse items = snapshot.data![index];
                      return GestureDetector(
                        onTap: () {
                          if (items.statusPick == "0") {
                            _navigateToListResi(context, items);
                          } else {
                            return;
                          }
                        },
                        child: Card(
                          color: items.statusPick == "0"
                              ? Color.fromARGB(255, 111, 187, 248)
                              : Color.fromARGB(255, 161, 161, 161),
                          margin: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${items.name}",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: AppColor.textPrimary),
                                ),
                                Divider(
                                  // Tambahkan Divider di sini
                                  color: Colors
                                      .grey, // Atur warna garis sesuai keinginan
                                  thickness: 1, // Atur ketebalan garis
                                ),
                                Text(
                                  items.address!,
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: AppColor.textPrimary,
                                  ),
                                  textAlign: TextAlign.left,
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              },
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToListResi(BuildContext context, Warehouse items) {
    Get.off(() => const ListResiView(), arguments: {
      'id': items.id,
      'name': items.name,
      'code': items.code,
      'agen': items.agenId,
      'kurir': items.kurirId,
      // 'idkurir': cLogin.user.value!.id,
      // 'name_kurir': cLogin.user.value!.name,
    });
  }
}
