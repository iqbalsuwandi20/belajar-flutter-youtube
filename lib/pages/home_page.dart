import 'package:flutter/material.dart';
import 'package:flutter_basic/controllers/home_controller.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue[900],
        title: const Text(
          "Reactive and Simple GetX",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Obx(
            //   () => Text(
            //     "${homeController.dataValue}",
            //     style: const TextStyle(
            //       fontSize: 50,
            //       fontStyle: FontStyle.italic,
            //     ),
            //   ),
            // ),
            GetBuilder<HomeController>(
              builder: (controller) => Text(
                "${homeController.dataValue}",
                style: const TextStyle(
                  fontSize: 50,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                homeController.addData();
              },
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.yellow[900]),
              child: const Text(
                "Add Data",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                homeController.refreshView();
              },
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.pink[900]),
              child: const Text(
                "Refresh page view",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
