import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();

  RxBool isHidden = true.obs;
  RxBool isRememberme = false.obs;

  void login() async {
    final box = GetStorage();

    if (emailC.text == "admin" && passC.text == "admin") {
      if (box.read("dataRememberme") != null) {
        box.remove("dataRememberme");
      }
      if (isRememberme.isTrue) {
        // simpan data email & password di local memory hp
        box.write(
          "dataRememberme",
          {
            "email": emailC.text,
            "password": passC.text,
          },
        );
      }
      Get.offAllNamed("/home");
    } else {
      Get.defaultDialog(
        title: "Error occurred",
        middleText: "email & password are still incorrect",
      );
    }
  }

  void logout() {
    Get.offAllNamed('/login_page');
  }
}
