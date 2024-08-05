import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue[900],
        title: const Text(
          "SnackBar GetX",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green[900]),
          onPressed: () {
            Get.snackbar("Hi", "This is snackbar getx",
                snackPosition: SnackPosition.BOTTOM,
                colorText: Colors.white,
                backgroundColor: Colors.yellow[900]);
            // ScaffoldMessenger.of(context).showSnackBar(
            //   SnackBar(
            //     content: const Text("Test"),
            //     action: SnackBarAction(
            //       label: "Hai",
            //       onPressed: () {},
            //     ),
            //   ),
            // );
          },
          child: const Text(
            "This is snackbar",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
