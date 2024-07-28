import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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
        title: const Text("SNACKBAR"),
        centerTitle: true,
        backgroundColor: Colors.red[900],
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text(
                  "Changing profile using the snackbar succeeded",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                action: SnackBarAction(
                  label: "Cancel",
                  onPressed: () {
                    print("Didn't change profile");
                  },
                  textColor: Colors.black,
                ),
                backgroundColor: Colors.red[900],
                duration: const Duration(
                  seconds: 2,
                ),
                margin: const EdgeInsets.all(
                  20,
                ),
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            );
          },
          child: const Text(
            "Show Snackbar",
          ),
        ),
      ),
    );
  }
}
