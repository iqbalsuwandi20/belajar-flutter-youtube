import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_basic/widgets/color_box.dart';

void main() {
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  // List<ColorBox> allItems = List.generate(
  //   10,
  //   (index) => ColorBox(
  //     text: "Box - ${index + 1}",
  //     colors: Color.fromARGB(
  //       255,
  //       200 + Random().nextInt(256),
  //       200 + Random().nextInt(256),
  //       200 + Random().nextInt(256),
  //     ),
  //   ),
  // );

  List<Map<String, dynamic>> data = List.generate(
    10,
    (index) => {
      "text": "Box - ${index + 1}",
      "color": Color.fromARGB(
        255,
        200 + Random().nextInt(256),
        200 + Random().nextInt(256),
        200 + Random().nextInt(256),
      ),
    },
  );

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Extra Widget"),
          centerTitle: true,
          backgroundColor: Colors.red[900],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: data
                .map(
                  (e) => ColorBox(
                    text: e["text"],
                    colors: e["color"],
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
