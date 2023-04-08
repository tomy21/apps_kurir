import 'package:apps_kurir/app/modules/home/controllers/home_controller.dart';
import 'package:apps_kurir/app/modules/home/views/introPages.dart';
import 'package:apps_kurir/app/modules/home/views/home_view.dart';
import 'package:apps_kurir/config/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

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
      ),
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: ()=> HomeView())
      ],
      home: const IntroPages(),
    );
  }
}
