// import 'package:apps_kurir/app/modules/home/controllers/home_controller.dart';
import 'package:apps_kurir/app/data/config/textStyle.dart';
import 'package:apps_kurir/app/modules/beranda/controllers/beranda_controller.dart';
import 'package:apps_kurir/app/modules/home/views/introPages.dart';
// import 'package:apps_kurir/app/modules/home/views/home_view.dart';
import 'package:apps_kurir/app/modules/listResi/controllers/list_resi_controller.dart';
import 'package:apps_kurir/config/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(ListResiController());
  Get.put(BerandaController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        primaryColor: AppColor.btnPrimary,
        colorScheme: const ColorScheme.light().copyWith(
          primary: AppColor.btnPrimary,
          onPrimary: AppColor.textWhite,
        ),
        textTheme: const TextTheme(
          bodyText1: AppTextStyles.poppinsTextStyle,
          bodyText2: AppTextStyles.poppinsTextStyle,
          
          // tambahkan lebih banyak gaya teks default jika perlu
        ),
      ),
      initialRoute: "/",
      // getPages: [
      //   GetPage(name: "/", page: ()=> BEra())
      // ],
      home: const IntroPages(),
    );
  }
}
