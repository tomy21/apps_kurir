import 'package:get/get.dart';

class ProfilController extends GetxController {
  //TODO: Implement ProfilController

  final selectedList = "".obs;
  List dropdownText = ['BCA','Mandiri','BRI'];
  void setSelected(String value){
    selectedList.value = value;
  }

  // final selectedReason ="".obs;
  var tabIndex = 0;

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }


  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
