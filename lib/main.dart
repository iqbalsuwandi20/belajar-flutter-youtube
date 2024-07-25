import 'package:flutter/material.dart';
import 'package:flutter_basic/widgets/color_box.dart';

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
          title: const Text("Extra Widget"),
          centerTitle: true,
          backgroundColor: Colors.red[900],
        ),
        body: const SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              ColorBox(text: "RED", colors: Colors.red),
              ColorBox(text: "YELLOW", colors: Colors.amber),
              ColorBox(text: "GREEN", colors: Colors.green),
              ColorBox(text: "RED", colors: Colors.red),
              ColorBox(text: "YELLOW", colors: Colors.amber),
              ColorBox(text: "GREEN", colors: Colors.green),
              ColorBox(text: "RED", colors: Colors.red),
              ColorBox(text: "YELLOW", colors: Colors.amber),
              ColorBox(text: "GREEN", colors: Colors.green),
            ],
          ),
        ),
      ),
    );
  }
}
