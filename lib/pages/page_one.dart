import 'package:flutter/material.dart';
import 'package:flutter_basic/controllers/page_one_controller.dart';
import 'package:flutter_basic/pages/page_two.dart';
import 'package:get/get.dart';

class PageOne extends StatelessWidget {
  PageOne({super.key});

  // mendefinisikan suatu class yang ingin di daftarkan
  // final pageOneC = Get.put(PageOneController());
  final pageOneController = Get.lazyPut(() => PageOneController());

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
            // Text(
            //   "My name is ${["name"]}, and I am ${pageOneC.data["age"]} years old",
            //   style: const TextStyle(fontWeight: FontWeight.bold),
            // ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PageTwo(),
                ));
              },
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.grey[900]),
              child: const Text(
                "Next page",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
