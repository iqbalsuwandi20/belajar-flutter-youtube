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
          backgroundColor: Colors.red[900],
          title: const Text("Judul"),
          centerTitle: true,
        ),
        body: GridView(
          padding: const EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: 10,
          ),
          // gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          //   maxCrossAxisExtent: 200,
          // ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1 / 2,
          ),
          children: [
            Container(
              color: Colors.amber,
            ),
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.pink,
            ),
            Container(
              color: Colors.blue,
            ),
            Container(
              color: Colors.amber,
            ),
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.pink,
            ),
            Container(
              color: Colors.blue,
            ),
            Container(
              color: Colors.amber,
            ),
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.pink,
            ),
            Container(
              color: Colors.blue,
            ),
            Container(
              color: Colors.amber,
            ),
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.pink,
            ),
            Container(
              color: Colors.blue,
            ),
            Container(
              color: Colors.amber,
            ),
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.pink,
            ),
            Container(
              color: Colors.blue,
            ),
            Container(
              color: Colors.amber,
            ),
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.pink,
            ),
            Container(
              color: Colors.blue,
            ),
            Container(
              color: Colors.amber,
            ),
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.pink,
            ),
            Container(
              color: Colors.blue,
            ),
            Container(
              color: Colors.amber,
            ),
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.pink,
            ),
            Container(
              color: Colors.blue,
            ),
            Container(
              color: Colors.amber,
            ),
          ],
        ),
        // body: Stack(
        //   alignment: AlignmentDirectional.topCenter,
        //   children: [
        //     Container(
        //       width: 200,
        //       height: 200,
        //       color: Colors.red,
        //     ),
        //     Container(
        //       width: 150,
        //       height: 150,
        //       color: Colors.amber,
        //     ),
        //     Container(
        //       width: 100,
        //       height: 100,
        //       color: Colors.green,
        //     ),
        //   ],
        // ),
        // body: Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     Container(
        //       width: 100,
        //       height: 100,
        //       color: Colors.red,
        //     ),
        //     Container(
        //       width: 150,
        //       height: 150,
        //       color: Colors.amber,
        //     ),
        //     Container(
        //       width: 200,
        //       height: 200,
        //       color: Colors.green,
        //     ),
        //   ],
        // ),
        // body: Column(
        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   children: [
        //     Container(
        //       width: 100,
        //       height: 100,
        //       color: Colors.red,
        //     ),
        //     Container(
        //       width: 150,
        //       height: 150,
        //       color: Colors.amber,
        //     ),
        //     Container(
        //       width: 200,
        //       height: 200,
        //       color: Colors.green,
        //     ),
        //   ],
        // ),
        // body: ListView(
        //   scrollDirection: Axis.horizontal,
        //   // scrollDirection: Axis.vertical,
        //   children: [
        //     Container(
        //       width: 100,
        //       height: 100,
        //       color: Colors.yellow,
        //       child: const Center(
        //         child: Text("Hallo"),
        //       ),
        //     ),
        //     Container(
        //       width: 100,
        //       height: 100,
        //       color: Colors.blue,
        //       child: const Center(
        //         child: Text("Hallo"),
        //       ),
        //     ),
        //     Container(
        //       width: 100,
        //       height: 100,
        //       color: Colors.grey,
        //       child: const Center(
        //         child: Text("Hallo"),
        //       ),
        //     ),
        //     Container(
        //       width: 100,
        //       height: 100,
        //       color: Colors.yellow,
        //       child: const Center(
        //         child: Text("Hallo"),
        //       ),
        //     ),
        //     Container(
        //       width: 100,
        //       height: 100,
        //       color: Colors.blue,
        //       child: const Center(
        //         child: Text("Hallo"),
        //       ),
        //     ),
        //     Container(
        //       width: 100,
        //       height: 100,
        //       color: Colors.grey,
        //       child: const Center(
        //         child: Text("Hallo"),
        //       ),
        //     ),
        //     Container(
        //       width: 100,
        //       height: 100,
        //       color: Colors.yellow,
        //       child: const Center(
        //         child: Text("Hallo"),
        //       ),
        //     ),
        //     Container(
        //       width: 100,
        //       height: 100,
        //       color: Colors.blue,
        //       child: const Center(
        //         child: Text("Hallo"),
        //       ),
        //     ),
        //     Container(
        //       width: 100,
        //       height: 100,
        //       color: Colors.grey,
        //       child: const Center(
        //         child: Text("Hallo"),
        //       ),
        //     ),
        //     Container(
        //       width: 100,
        //       height: 100,
        //       color: Colors.yellow,
        //       child: const Center(
        //         child: Text("Hallo"),
        //       ),
        //     ),
        //     Container(
        //       width: 100,
        //       height: 100,
        //       color: Colors.blue,
        //       child: const Center(
        //         child: Text("Hallo"),
        //       ),
        //     ),
        //     Container(
        //       width: 100,
        //       height: 100,
        //       color: Colors.grey,
        //       child: const Center(
        //         child: Text("Hallo"),
        //       ),
        //     ),
        //   ],
        // ),
        // body: Center(
        //   child: SingleChildScrollView(
        //     scrollDirection: Axis.horizontal,
        //     child: Row(
        //       children: [
        //         Container(
        //           width: 100,
        //           height: 100,
        //           color: Colors.yellow,
        //           child: const Center(
        //             child: Text("Hallo"),
        //           ),
        //         ),
        //         Container(
        //           width: 100,
        //           height: 100,
        //           color: Colors.blue,
        //           child: const Center(
        //             child: Text("Hallo"),
        //           ),
        //         ),
        //         Container(
        //           width: 100,
        //           height: 100,
        //           color: Colors.grey,
        //           child: const Center(
        //             child: Text("Hallo"),
        //           ),
        //         ),
        //         Container(
        //           width: 100,
        //           height: 100,
        //           color: Colors.yellow,
        //           child: const Center(
        //             child: Text("Hallo"),
        //           ),
        //         ),
        //         Container(
        //           width: 100,
        //           height: 100,
        //           color: Colors.blue,
        //           child: const Center(
        //             child: Text("Hallo"),
        //           ),
        //         ),
        //         Container(
        //           width: 100,
        //           height: 100,
        //           color: Colors.grey,
        //           child: const Center(
        //             child: Text("Hallo"),
        //           ),
        //         ),
        //         Container(
        //           width: 100,
        //           height: 100,
        //           color: Colors.yellow,
        //           child: const Center(
        //             child: Text("Hallo"),
        //           ),
        //         ),
        //         Container(
        //           width: 100,
        //           height: 100,
        //           color: Colors.blue,
        //           child: const Center(
        //             child: Text("Hallo"),
        //           ),
        //         ),
        //         Container(
        //           width: 100,
        //           height: 100,
        //           color: Colors.grey,
        //           child: const Center(
        //             child: Text("Hallo"),
        //           ),
        //         ),
        //         Container(
        //           width: 100,
        //           height: 100,
        //           color: Colors.yellow,
        //           child: const Center(
        //             child: Text("Hallo"),
        //           ),
        //         ),
        //         Container(
        //           width: 100,
        //           height: 100,
        //           color: Colors.blue,
        //           child: const Center(
        //             child: Text("Hallo"),
        //           ),
        //         ),
        //         Container(
        //           width: 100,
        //           height: 100,
        //           color: Colors.grey,
        //           child: const Center(
        //             child: Text("Hallo"),
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        // body: Center(
        //   child: SingleChildScrollView(
        //     child: Column(
        //       children: [
        //         Container(
        //           width: 100,
        //           height: 100,
        //           color: Colors.yellow,
        //           child: const Center(
        //             child: Text("Hallo"),
        //           ),
        //         ),
        //         Container(
        //           width: 100,
        //           height: 100,
        //           color: Colors.blue,
        //           child: const Center(
        //             child: Text("Hallo"),
        //           ),
        //         ),
        //         Container(
        //           width: 100,
        //           height: 100,
        //           color: Colors.grey,
        //           child: const Center(
        //             child: Text("Hallo"),
        //           ),
        //         ),
        //         Container(
        //           width: 100,
        //           height: 100,
        //           color: Colors.yellow,
        //           child: const Center(
        //             child: Text("Hallo"),
        //           ),
        //         ),
        //         Container(
        //           width: 100,
        //           height: 100,
        //           color: Colors.blue,
        //           child: const Center(
        //             child: Text("Hallo"),
        //           ),
        //         ),
        //         Container(
        //           width: 100,
        //           height: 100,
        //           color: Colors.grey,
        //           child: const Center(
        //             child: Text("Hallo"),
        //           ),
        //         ),
        //         Container(
        //           width: 100,
        //           height: 100,
        //           color: Colors.yellow,
        //           child: const Center(
        //             child: Text("Hallo"),
        //           ),
        //         ),
        //         Container(
        //           width: 100,
        //           height: 100,
        //           color: Colors.blue,
        //           child: const Center(
        //             child: Text("Hallo"),
        //           ),
        //         ),
        //         Container(
        //           width: 100,
        //           height: 100,
        //           color: Colors.grey,
        //           child: const Center(
        //             child: Text("Hallo"),
        //           ),
        //         ),
        //         Container(
        //           width: 100,
        //           height: 100,
        //           color: Colors.yellow,
        //           child: const Center(
        //             child: Text("Hallo"),
        //           ),
        //         ),
        //         Container(
        //           width: 100,
        //           height: 100,
        //           color: Colors.blue,
        //           child: const Center(
        //             child: Text("Hallo"),
        //           ),
        //         ),
        //         Container(
        //           width: 100,
        //           height: 100,
        //           color: Colors.grey,
        //           child: const Center(
        //             child: Text("Hallo"),
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        // body: Center(
        //   child: Stack(
        //     children: [
        //       Container(
        //         width: 100,
        //         height: 100,
        //         color: Colors.yellow,
        //         child: const Center(
        //           child: Text("Hallo"),
        //         ),
        //       ),
        //       Container(
        //         width: 50,
        //         height: 50,
        //         color: Colors.blue,
        //         child: const Center(
        //           child: Text("Hallo"),
        //         ),
        //       ),
        //       Container(
        //         width: 20,
        //         height: 20,
        //         color: Colors.grey,
        //         child: const Center(
        //           child: Text("Hallo"),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        // body: Center(
        //   child: Column(
        //     children: [
        //       Container(
        //         width: 100,
        //         height: 100,
        //         color: Colors.yellow,
        //         child: const Center(
        //           child: Text("Hallo"),
        //         ),
        //       ),
        //       Container(
        //         width: 100,
        //         height: 100,
        //         color: Colors.blue,
        //         child: const Center(
        //           child: Text("Hallo"),
        //         ),
        //       ),
        //       Container(
        //         width: 100,
        //         height: 100,
        //         color: Colors.grey,
        //         child: const Center(
        //           child: Text("Hallo"),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        // body: Center(
        //   child: Row(
        //     children: [
        //       Container(
        //         width: 100,
        //         height: 100,
        //         color: Colors.yellow,
        //         child: const Center(
        //           child: Text("Hallo"),
        //         ),
        //       ),
        //       Container(
        //         width: 100,
        //         height: 100,
        //         color: Colors.blue,
        //         child: const Center(
        //           child: Text("Hallo"),
        //         ),
        //       ),
        //       Container(
        //         width: 100,
        //         height: 100,
        //         color: Colors.grey,
        //         child: const Center(
        //           child: Text("Hallo"),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
