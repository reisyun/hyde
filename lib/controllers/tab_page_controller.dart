import 'package:get/get.dart';

class TabPageController extends GetxController {
  final tabIndex = 0.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
    update();
  }
}
