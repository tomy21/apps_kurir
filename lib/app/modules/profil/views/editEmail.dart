import 'package:apps_kurir/app/modules/profil/views/profil_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/app_color.dart';

class EditEmail extends StatelessWidget {
  const EditEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cEmailLama = TextEditingController();
    final cEmailBaru = TextEditingController();

    
    return Scaffold(
      body: Column(
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
                  "Edit Email",
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
                formInput(cEmailLama, "Email yang lama", true),
                SizedBox(
                  height: 13,
                ),
                formInput(cEmailBaru, "Email yang baru", true),
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
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 25,
            ),
            child: Text(
              "Pastikan email kamu masih aktif",
              style: TextStyle(fontSize: 14),
              textAlign: TextAlign.left,
            ),
          )
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
          borderSide: BorderSide(
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