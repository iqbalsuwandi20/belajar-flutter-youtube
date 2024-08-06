import 'package:get/get.dart';

class HomeController extends GetxController {
  // variables are always being monitored
  // var dataValue = 0.obs; for reactive state
  int dataValue = 0; // for simple state

  void addData() {
    dataValue = dataValue + 1;
  }

  void refreshView() {
    update();
  }
}
