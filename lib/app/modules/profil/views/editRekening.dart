import 'package:apps_kurir/app/modules/profil/controllers/profil_controller.dart';
import 'package:apps_kurir/app/modules/profil/views/profil_view.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/app_color.dart';

class Editrekening extends StatelessWidget {
  const Editrekening({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cProfil = Get.put(ProfilController());
    final cNamarekening = TextEditingController();
    final cNorekening = TextEditingController();

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
                    "Edit Rekening",
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
                      "BCA",
                      "Mandiri",
                      "CIMB Niaga",
                      "BRI",
                      "BRI",
                      "BRI",
                      "BRI",
                      "BRI",
                      "asdasd",
                      "asdasdsa",
                      "asdasdsad",
                      "asdasdsad",
                    ],
                    dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        hintText: "Pilih Rekening",
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
                    children: [
                      SizedBox(
                        height: 13,
                      ),
                      formInput(cNamarekening, "Nama di rekening", true),
                      SizedBox(
                        height: 13,
                      ),
                      formInput(cNamarekening, "Cabang buka rekening", true),
                      SizedBox(
                        height: 13,
                      ),
                      formInput(cNorekening, "No Rekening", true),
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
                    "Alasan ganti no.rekening",
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
                      Text("Rekening sudah tidak aktif"),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        value: "Rekening dipakai untuk keperluan lain",
                        groupValue: 1,
                        onChanged: (value) {},
                      ),
                      Text("Rekening dipakai untuk keperluan lain"),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        value: "Rekening terblokir",
                        groupValue: 1,
                        onChanged: (value) {},
                      ),
                      Text("Rekening terblokir"),
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
