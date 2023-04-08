import 'package:apps_kurir/app/modules/beranda/controllers/beranda_controller.dart';
import 'package:apps_kurir/app/modules/pendapatan/controllers/pendapatan_controller.dart';
import 'package:apps_kurir/app/modules/profil/controllers/profil_controller.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<BerandaController>(
      () => BerandaController(),
    );
    Get.lazyPut<PendapatanController>(
      () => PendapatanController(),
    );
    Get.lazyPut<ProfilController>(
      () => ProfilController(),
    );
  }
}
