import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red[900],
        title: const Text(
          "Class Binding GetX",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green[900]),
          onPressed: () {
            // binding sudah di folder routes
            Get.toNamed('/counter');

            // Get.to(
            //   () => CounterPage(),
            //   binding: BindingsBuilder.put(() => CounterController()),
            // );
          },
          child: const Text(
            "Counter Page",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
