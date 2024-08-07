import 'package:flutter/material.dart';
import 'package:flutter_basic/controllers/login_controller.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});

  LoginController loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.yellow[900],
        title: const Text(
          "Get Storage",
          style: TextStyle(color: Colors.white),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          loginController.logout();
        },
        child: const Icon(Icons.logout_outlined),
      ),
    );
  }
}
