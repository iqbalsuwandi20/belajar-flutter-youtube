import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Basic"),
          centerTitle: true,
          backgroundColor: Colors.red[900],
        ),
        body: Center(
          child: Image.asset("images/image.jpg"),
        ),
        // body: const Center(
        //   child: Image(
        //     image: NetworkImage(
        //         "https://docs.flutter.dev/assets/images/dash/dash-fainting.gif"),
        //   ),
        // ),
        // body: const Center(
        //   child: Image(
        //     image: AssetImage("images/image.jpg"),
        //   ),
        // ),
        // body: Center(
        //   child: Icon(
        //     Icons.home,
        //     size: 100,
        //     color: Colors.red[900],
        //   ),
        // ),
        // body: Center(
        //   child: ElevatedButton(
        //     onPressed: () {
        //       print("Klik saya");
        //     },
        //     child: const Text("Ini Button saya"),
        //   ),
        // ),
        // body: const Center(
        //   child: FlutterLogo(
        //     size: 100,
        //   ),
        // ),
        // body: Center(
        //   child: Container(
        //     width: 200,
        //     height: 200,
        //     color: Colors.green,
        //     child: const Center(
        //       child: Text("Widget Dasar"),
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
