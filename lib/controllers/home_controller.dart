import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt dataValue = 0.obs;

  void change() => dataValue++;

  @override
  void onInit() {
    // ever(dataValue, (callback) => print("changes"));
    // once(dataValue, (callback) => print("one changes"));
    // debounce(
    //   dataValue,
    //   (callback) => print("execution 2 seconds after stop monitoring"),
    //   time: const Duration(seconds: 2),
    // );
    interval(
      dataValue,
      (callback) => print("execution 2 seconds"),
      time: const Duration(seconds: 2),
    );
    super.onInit();
  }
}
