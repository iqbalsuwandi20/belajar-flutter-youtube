import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[900],
          title: const Text(
            "Stateless vs Stateful",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                value.toString(),
                style: const TextStyle(
                  fontSize: 50,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      value = value - 1;
                      print(value);
                      setState(() {});
                    },
                    child: Icon(
                      Icons.remove,
                      color: Colors.red[900],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      value = value + 1;
                      print(value);
                      setState(() {});
                    },
                    child: Icon(
                      Icons.add,
                      color: Colors.red[900],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/**
 * STATELESS
 */
// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// // ignore: must_be_immutable
// class MyApp extends StatelessWidget {
//   MyApp({super.key});

//   int value = 0;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.red[900],
//           title: const Text(
//             "Stateless vs Statefull",
//             style: TextStyle(
//               color: Colors.white,
//             ),
//           ),
//           centerTitle: true,
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 value.toString(),
//                 style: const TextStyle(
//                   fontSize: 50,
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   ElevatedButton(
//                     onPressed: () {
//                       value = value - 1;
//                       print(value);
//                     },
//                     child: Icon(
//                       Icons.remove,
//                       color: Colors.red[900],
//                     ),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       value = value + 1;
//                       print(value);
//                     },
//                     child: Icon(
//                       Icons.add,
//                       color: Colors.red[900],
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
