import 'package:get/get.dart';

import '../controllers/list_resi_controller.dart';

class ListResiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListResiController>(
      () => ListResiController(),
    );
  }
}
