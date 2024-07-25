import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Widget Builder"),
          centerTitle: true,
        ),
        body: GridView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: 50,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) => Container(
            color: Color.fromARGB(
              255,
              60 + Random().nextInt(151),
              60 + Random().nextInt(151),
              60 + Random().nextInt(151),
            ),
          ),
        ),
        // body: ListView.builder(
        //   itemCount: 10,
        //   itemBuilder: (context, index) => ColorBox(
        //     text: "What is the Box - ${index + 1}",
        //     colors: Color.fromARGB(
        //       255,
        //       60 + Random().nextInt(200),
        //       60 + Random().nextInt(200),
        //       60 + Random().nextInt(200),
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
