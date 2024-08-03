import 'package:flutter/material.dart';
import 'package:flutter_basic/pages/home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green[900],
        title: const Text(
          "Login Page",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const TextField(
            decoration: InputDecoration(
              label: Text("Email"),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const TextField(
            decoration: InputDecoration(
              label: Text("Password"),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green[900],
            ),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
            },
            child: const Text(
              "Login",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
