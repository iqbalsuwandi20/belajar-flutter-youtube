import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt dataInt = 0.obs;
  RxString dataString = "data".obs;
  RxDouble dataDouble = 0.0.obs;
  RxBool dataBoolean = false.obs;
  RxList<int> dataList = [1, 2, 3].obs;
  RxSet<int> dataSet = {1, 2, 3}.obs;
  RxMap<String, dynamic> dataMap = {
    "id": 1,
    "name": "Raul",
    "age": 17,
  }.obs;

  void increment() {
    dataInt++;
  }

  void decrement() {
    dataInt--;
  }

  void updateDataString() {
    dataString.value = "data (update)";
  }

  void resetDataString() {
    dataString.value = "data";
  }

  void incrementDouble() {
    dataDouble.value++;
  }

  void decrementDouble() {
    dataDouble.value--;
  }

  void changeBool() {
    dataBoolean.toggle();
    // if (dataBoolean.isTrue) {
    //   dataBoolean.value = false;
    // } else {
    //   dataBoolean.value = true;
    // }
  }

  int nextValue = 4;

  void addListValue() {
    dataList.add(nextValue);
    nextValue++;
  }

  void changeListValue() {
    dataList[0] = 99;
  }

  void addSetValue() {
    dataSet.add(nextValue);
    nextValue++;
  }

  void changeName() {
    dataMap["name"] = "Iqbal";
  }

  void resetDataMap() {
    dataMap["name"] = "Raul";
  }
}
