import 'package:flutter_basic/controllers/counter_controller.dart';
import 'package:get/get.dart';

class CounterBindings extends Bindings {
  @override
  void dependencies() {
    // Get.put(CounterController());
    Get.lazyPut(() => CounterController());
  }
}
