import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dialog"),
        centerTitle: true,
        backgroundColor: Colors.red[900],
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                title: const Text(
                  "This is a dialog title",
                ),
                content: const Text(
                  "This is the description of the dialog, you can see it here",
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      "Okay, I got it",
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      "Cancel",
                    ),
                  ),
                ],
              ),
            );
          },
          child: const Text("Show Dialog"),
        ),
      ),
    );
  }
}
