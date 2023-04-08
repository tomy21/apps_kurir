import 'package:apps_kurir/app/modules/profil/controllers/profil_controller.dart';
import 'package:apps_kurir/app/modules/profil/views/profil_view.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/app_color.dart';

class EditKendaraan extends StatelessWidget {
  const EditKendaraan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cProfil = Get.put(ProfilController());
    final merek = TextEditingController();
    final platNo = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 30,
                    ),
                    onPressed: () => Get.back(),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    "Edit Kendaraan",
                    style: TextStyle(
                      fontSize: 20,
                      color: AppColor.textPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                children: [
                  DropdownSearch<String>(
                    popupProps: PopupProps.menu(
                      isFilterOnline: true,
                      showSelectedItems: true,
                      fit: FlexFit.tight,
                      disabledItemFn: (String s) => s.startsWith('I'),
                    ),
                    items: [
                      "Supra",
                      "Mio",
                      "Beat",
                      "Jupite",
                      "Karisma",
                      "Byson",
                      "Vxion",
                      "Thunder",
                      "Vario",
                    ],
                    dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        hintText: "Pilih merek motor",
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: AppColor.textSoft2,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: AppColor.btnPrimary,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    onChanged: (value) => print(value),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 13,
                      ),
                      formInput(platNo, "Masukan plat no baru", true),
                      SizedBox(
                        height: 13,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          margin: EdgeInsets.only(
                            left: 50,
                          ),
                          child: Text(
                            "Foto STNK",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: 10,
                        ),
                        width: 150,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                          color: AppColor.textSoft2,
                        ),
                        child: Center(
                          child: Icon(Icons.add, size: 50,color: AppColor.textSoft,),
                        ),
                      ),
                      SizedBox(
                        height: 13,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Alasan ganti no.kendaraan",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "Silahkan pilih salah satu :",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    children: [
                      Radio(
                        value: 1,
                        groupValue: cProfil.tabIndex,
                        onChanged: (value) {
                          cProfil.tabIndex;
                        },
                      ),
                      Text("Kendaraan Rusak"),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        value: 0,
                        groupValue: 1,
                        onChanged: (value) {},
                      ),
                      Text("Kendaraan lama sudah tidak dipakai"),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        value: "Lainnya",
                        groupValue: 1,
                        onChanged: (value) {},
                      ),
                      Text("Lainnya"),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: ElevatedButton(
                onPressed: () => Get.off(() => const ProfilView()),
                child: const Text(
                  "Simpan",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: AppColor.textWhite,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(MediaQuery.of(context).size.width, 50),
                  backgroundColor: AppColor.btnPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  foregroundColor: AppColor.textWhite,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget formInput(
    TextEditingController controller,
    String hint, [
    bool obsecure = false,
  ]) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColor.textSoft2,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        fillColor: AppColor.textWhite,
        filled: true,
        enabled: obsecure,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        hintText: hint,
      ),
      obscureText: obsecure,
    );
  }
}
