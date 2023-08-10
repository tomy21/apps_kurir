import 'package:apps_kurir/app/modules/home/views/daftarPage.dart';
import 'package:apps_kurir/app/modules/home/views/loginPages.dart';
import 'package:apps_kurir/config/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class IntroPages extends StatelessWidget {
  const IntroPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 270,
              height: 270,
              child: SvgPicture.asset("assets/img/logo_courier.svg"),
            ),
            Text(
              'Aplikasi Kurir',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 56,
              width: 200,
              child: Image.asset("assets/img/logo crewdible fix-01.png"),
            ),
            SizedBox(
              height: 150,
            ),
            ElevatedButton(
              onPressed: () => Get.off(() => const LoginPages()),
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
            SizedBox(
              height: 11,
            ),
            // ElevatedButton(
            //   onPressed: () => Get.off(()=>DaftarPages()),
            //   child: const Text(
            //     "Daftar Akun",
            //     style: TextStyle(
            //       fontSize: 16.0,
            //       color: AppColor.btnPrimary,
            //     ),
            //   ),
            //   style: ElevatedButton.styleFrom(
            //     fixedSize: const Size(326, 50),
            //     backgroundColor: AppColor.textWhite,
            //     side: BorderSide(
            //       color: AppColor.btnPrimary,
            //       width: 2.0,
            //     ),
            //     foregroundColor: AppColor.btnPrimary,
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(15),
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 50,
            ),
            Text(
              "Version : 1.0.1 (Beta)",
              style: TextStyle(
                fontSize: 10,
              ),
            )
          ],
        ),
      ),
    );
  }
}
