import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.brown[900],
        title: const Text(
          "Route Named Management GetX",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue[900]),
            onPressed: () {
              // menggunakan routes getx
              Get.toNamed("page_1");

              // menggunakan routes
              // Navigator.of(context).pushNamed("page_1");

              // Navigator.of(context).push(MaterialPageRoute(
              //   builder: (context) => const Page1(),
              // ));
            },
            child: const Text(
              "Page 1",
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[900]),
            onPressed: () {
              // sama seperti pushReplacement
              // Get.off(const Page2());
              // Get.to(const Page2());

              Get.toNamed("/page_2");
            },
            child: const Text(
              "Page 2",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
