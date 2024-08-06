import 'package:flutter/material.dart';
import 'package:flutter_basic/controllers/page_one_controller.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class PageTwo extends StatelessWidget {
  PageTwo({super.key});

  // semua yang sudah di daftarkan, tinggal di cari menggunakan get.find()
  PageOneController pageOneController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.purple[900],
        title: const Text(
          "Dependency Management GetX",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hi ${pageOneController.data["name"]}! your current age is ${pageOneController.data["age"]}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
