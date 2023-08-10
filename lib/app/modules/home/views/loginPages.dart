import 'package:apps_kurir/app/modules/home/controllers/cLogin.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:apps_kurir/app/modules/home/views/forgetPass.dart';
import 'package:apps_kurir/config/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPages extends StatelessWidget {
  const LoginPages({Key? key}) : super(key: key);

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
                  "Masuk",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Yuk kita mulai kerja !",
                  style: TextStyle(fontSize: 14, color: AppColor.textSoft),
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
                        style: TextStyle(color: const Color.fromARGB(255, 53, 53, 53)),
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
                          hintText: 'Masukan Password ',
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
                        onPressed: () => cLogin.login(controllerEmail.text, controllerPassword.text),
                        child: const Text(
                          "Masuk",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: AppColor.textWhite,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(326, 50),
                          backgroundColor: AppColor.btnPrimary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          foregroundColor: AppColor.textWhite,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Obx(() {
                      return cLogin.isLoading.value
                          ? SpinKitCircle(
                              color: Colors.blue,
                              size: 30.0,
                            )
                          : SizedBox.shrink();
                    }),
                  ],
                ),
                SizedBox(
                  height: 17,
                ),
                // Column(
                //   children: [
                //     TextButton(
                //       onPressed: () => Get.off(() => ForgetPass()),
                //       child: const Text(
                //         'Lupa Password !',
                //         style: TextStyle(
                //           fontSize: 14,
                //           fontWeight: FontWeight.w600,
                //           color: AppColor.btnPrimary,
                //         ),
                //       ),
                //     )
                //   ],
                // )
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
      style: TextStyle(color: const Color.fromARGB(255, 53, 53, 53)),
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
