import 'package:apps_kurir/app/modules/profil/views/profil_view.dart';
import 'package:apps_kurir/config/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfil extends StatelessWidget {
  const EditProfil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cNama = TextEditingController();
    final cKurir = TextEditingController();
    final cAlamat = TextEditingController();
    return Scaffold(
      body: Column(
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
                  "Edit Profil",
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColor.textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
          Column(
            children: [
              CircleAvatar(
                radius: 40,
                child: Icon(Icons.camera_alt_outlined),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "ID : 231231 ",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              children: [
                formInput(cNama, "Masukan nama kamu", true),
                SizedBox(
                  height: 13,
                ),
                formInput(cKurir, "Motorist / Driver", true),
                SizedBox(
                  height: 13,
                ),
                formInput(cAlamat, "Masukan alamat kamu", true),
                SizedBox(
                  height: 13,
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
          borderSide: BorderSide(color: AppColor.textSoft2, width: 2.0,),
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
