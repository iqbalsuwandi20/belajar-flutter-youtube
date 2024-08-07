import 'package:flutter/material.dart';
import 'package:flutter_basic/controllers/counter_controller.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CounterPage extends StatelessWidget {
  CounterPage({super.key});

  CounterController counterC = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const SizedBox(),
        backgroundColor: Colors.red[900],
        title: const Text(
          "Bindings GetX",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Text(
                "${counterC.data}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow[900]),
                  onPressed: () {
                    counterC.decrement();
                  },
                  child: const Text(
                    "-",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow[900]),
                  onPressed: () {
                    counterC.increment();
                  },
                  child: const Text(
                    "+",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
