import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_basic/controllers/login_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // LoginController loginController = Get.find();

  final loginController = Get.put(LoginController());

  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    if (box.read("dataRememberme") != null) {
      loginController.emailC = box.read("dataRememberme")["email"];
      loginController.passC = box.read("dataRememberme")["password"];
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.yellow[900],
        title: const Text(
          "Get Storage",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextField(
            controller: loginController.emailC,
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              icon: Icon(Icons.email_outlined),
              label: Text("Email"),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Obx(
            () => TextField(
              controller: loginController.passC,
              autocorrect: false,
              obscureText: loginController.isHidden.value,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                icon: const Icon(Icons.vpn_key_outlined),
                label: const Text("Password"),
                suffixIcon: IconButton(
                    onPressed: () => loginController.isHidden.toggle(),
                    icon: const Icon(
                      Icons.remove_red_eye_outlined,
                    )),
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          Obx(
            () => CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              value: loginController.isRememberme.value,
              activeColor: Colors.yellow[900],
              title: const Text("Remember me"),
              onChanged: (value) {
                loginController.isRememberme.toggle();
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[900]),
            onPressed: () {
              loginController.login();
            },
            child: const Text(
              "LOGIN",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
