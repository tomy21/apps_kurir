import 'package:apps_kurir/app/modules/home/views/loginPages.dart';
import 'package:apps_kurir/config/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DaftarPages extends StatelessWidget {
  const DaftarPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controllerNama = TextEditingController();
    final controllerEmail = TextEditingController();
    final controllerKtp = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(17.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Selamat',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Datang,',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Silahkan isi data diri kamu,',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColor.textSoft),
                ),
                SizedBox(
                  height: 23,
                ),
                Column(
                  children: [
                    formInput(controllerNama, 'Masukan Nama Kamu'),
                    SizedBox(
                      height: 7,
                    ),
                    formInput(controllerEmail, 'Masukan Email Kamu'),
                    SizedBox(
                      height: 7,
                    ),
                    formInput(controllerKtp, 'Masukan Alamat Kamu Sesuai KTP'),
                    SizedBox(
                      height: 7,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            const Text('Foto KTP', style: TextStyle(fontSize: 12),),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColor.textSoft,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(15))
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(70.0),
                                child: Center(
                                  child: Icon(Icons.camera_alt),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const Text('Foto dengan KTP', style: TextStyle(fontSize: 12),),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColor.textSoft,
                                    width: 1,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              child: const Padding(
                                padding: EdgeInsets.all(70.0),
                                child: Center(
                                  child: Icon(Icons.camera_alt),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
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
                      "Daftar Sekarang",
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
                SizedBox(height: 17,),
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
          ),
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
