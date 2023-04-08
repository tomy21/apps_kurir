import 'package:apps_kurir/app/modules/home/views/loginPages.dart';
import 'package:apps_kurir/app/modules/profil/views/editEmail.dart';
import 'package:apps_kurir/app/modules/profil/views/editKendaraan.dart';
import 'package:apps_kurir/app/modules/profil/views/editNoHp.dart';
import 'package:apps_kurir/app/modules/profil/views/editProfil.dart';
import 'package:apps_kurir/app/modules/profil/views/editRekening.dart';
import 'package:apps_kurir/config/app_color.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profil_controller.dart';

class ProfilView extends GetView<ProfilController> {
  const ProfilView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Column(
        children: [
          // header
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.all(30),
                  child: Text(
                    "Profil",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      radius: 30,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "ID : 231231",
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "Tomy Agung Saputro",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Kurir motorist",
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                        onPressed: ()=> Get.to(()=> const EditProfil()),
                        icon: Icon(
                          Icons.edit,
                        ))
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 30,
                  ),
                  child: Text(
                    "Edit Akun",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 30,
                    right: 30,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                      border: Border.all(
                        color: AppColor.textSoft2,
                        width: 2,
                      )),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 35, horizontal: 15),
                      child: Column(
                        children: [
                          _listAkun(
                            icon: Icons.call,
                            label1: "Ganti No HP",
                            label2: "+6281288530882",
                            navigasi: const EditNoHP(),
                          ),
                          Divider(
                            thickness: 2,
                            color: AppColor.textSoft2,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          _listAkun(
                            icon: Icons.email_outlined,
                            label1: "Ganti Email",
                            label2: "tomy@crew.id",
                            navigasi: const EditEmail(),
                          ),
                          Divider(
                            thickness: 2,
                            color: AppColor.textSoft2,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          _listAkun(
                            icon: Icons.credit_card,
                            label1: "Ganti Rekening",
                            label2: "BCA an T*** A**** S******",
                            navigasi: Editrekening(),
                          ),
                          Divider(
                            thickness: 2,
                            color: AppColor.textSoft2,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          _listAkun(
                            icon: Icons.motorcycle_outlined,
                            label1: "Ganti Kendaraan",
                            label2: "B 1234 ABC",
                            navigasi: const EditKendaraan(),
                          ),
                          Divider(
                            thickness: 2,
                            color: AppColor.textSoft2,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Color.fromARGB(255, 244, 184, 188),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            onPressed: () => Get.off(()=> const LoginPages()),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 100),
                              child: Text(
                                "Keluar",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.bgDanger),
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
          // body
        ],
      ),
    );
  }

  _listAkun({IconData? icon, String? label1, String? label2, dynamic navigasi}) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 50,
              child: Icon(
                icon,
                size: 40,
              ),
            ),
            Container(
              width: 180,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$label1',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "$label2",
                    style: TextStyle(fontSize: 12, color: AppColor.textSoft2),
                  ),
                ],
              ),
            ),
            Container(
              width: 50,
              child: IconButton(
                onPressed: () =>Get.to(navigasi),
                icon :const Icon(Icons.arrow_forward_ios_rounded),
                iconSize: 30,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
