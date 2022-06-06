import 'package:get/get.dart';

class ToggleController extends GetxController {
  bool state = false;

  void onToggle() {
    state = !state;
    update();
  }
}
