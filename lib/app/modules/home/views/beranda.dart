import 'package:apps_kurir/app/modules/beranda/views/beranda_view.dart';
import 'package:apps_kurir/app/modules/pendapatan/views/pendapatan_view.dart';
import 'package:apps_kurir/app/modules/profil/views/profil_view.dart';
import 'package:apps_kurir/config/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class BerandaPages extends GetView<HomeController> {
  const BerandaPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ... other properties
      body: Center(
        child: Text('BerandaView Content'),
      ),
    );
  }
  // Widget build(BuildContext context) {
  //   final homeController = Get.put(HomeController());
    
    
    // return GetBuilder<HomeController>(builder: (controller) {
    //   return Scaffold(
    //     extendBody: true,
    //     bottomNavigationBar: Container(
    //       margin: const EdgeInsets.all(20),
    //       decoration: const BoxDecoration(
    //         borderRadius: BorderRadius.only(
    //           topRight: Radius.circular(30),
    //           topLeft: Radius.circular(30),
    //           bottomRight: Radius.circular(30),
    //           bottomLeft: Radius.circular(30),
    //         ),
    //         boxShadow: [
    //           BoxShadow(
    //               color: AppColor.textSoft, spreadRadius: 2, blurRadius: 10),
    //         ],
    //         color: Colors.transparent,
    //       ),
    //       child: ClipRRect(
    //         borderRadius: const BorderRadius.only(
    //           topLeft: Radius.circular(30.0),
    //           topRight: Radius.circular(30.0),
    //           bottomRight: Radius.circular(30),
    //           bottomLeft: Radius.circular(30),
    //         ),
    //         child: BottomNavigationBar(
    //           fixedColor: AppColor.btnPrimary,
    //           onTap: controller.changeTabIndex,
    //           currentIndex: controller.tabIndex,
    //           items: [
    //             _bottomNavigationBarItem(
    //                 icon: Icons.home_outlined, label: 'Home'),
    //             _bottomNavigationBarItem(
    //                 icon: Icons.account_balance_wallet_rounded,
    //                 label: 'Pendapatan'),
    //             _bottomNavigationBarItem(
    //                 icon: Icons.person_outline, label: 'Profil'),
    //           ],
    //         ),
    //       ),
    //     ),
    //     body: IndexedStack(
    //       index: controller.tabIndex,
    //       children: [
    //         BerandaView(),
    //         PendapatanView(),
    //         ProfilView(),
    //       ],
    //     ),
    //   );
    // });
  // }

  _bottomNavigationBarItem({IconData? icon, String? label}) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}
