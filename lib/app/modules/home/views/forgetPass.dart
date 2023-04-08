import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/app_color.dart';
import '../controllers/cLogin.dart';
import 'loginPages.dart';

class ForgetPass extends StatelessWidget {
  const ForgetPass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cLogin = Get.put(CLogin());
    final controllerEmail = TextEditingController();
    final controllerPassword = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(17.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Reset",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Password",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 64,
                ),
                Column(
                  children: [
                    formInput(controllerEmail, 'Masukan Email Kamu'),
                    SizedBox(
                      height: 18,
                    ),
                    Obx(
                      () => TextField(
                        controller: controllerPassword,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () => cLogin.hidden.toggle(),
                            icon: cLogin.hidden.isTrue
                                ? const Icon(
                                    Icons.remove_red_eye_outlined,
                                    color: AppColor.textSoft,
                                  )
                                : const Icon(
                                    Icons.remove_red_eye,
                                    color: AppColor.textSoft,
                                  ),
                          ),
                          fillColor: Colors.blueGrey[100],
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          hintText: 'Masukan password baru kamu ',
                        ),
                        obscureText: cLogin.hidden.value,
                      ),
                    ),
                    SizedBox(
                      height: 39,
                    ),
                    SizedBox(
                      height: 44,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => Get.off(() => const LoginPages()),
                        child: const Text(
                          "Rubah Password",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: AppColor.textWhite,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(326, 50),
                          backgroundColor: AppColor.btnPrimary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          foregroundColor: AppColor.textWhite,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 11,
                    ),
                    SizedBox(
                      height: 44,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => Get.off(() => const LoginPages()),
                        child: const Text(
                          "Batal",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: AppColor.textWhite,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(326, 50),
                          backgroundColor: AppColor.bgDanger,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          foregroundColor: AppColor.textWhite,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
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
        fillColor: Colors.blueGrey[100],
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(6),
        ),
        hintText: hint,
      ),
      obscureText: obsecure,
    );
  }
}
