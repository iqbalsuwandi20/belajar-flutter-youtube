import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = "Name not found";
  String email = "Email not found";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        title: const Text(
          "HTTP Request Delete",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              var response = await http.get(
                Uri.parse("https://reqres.in/api/users/1"),
              );

              Map<String, dynamic> mybody = json.decode(response.body);

              print(mybody);

              setState(() {
                name =
                    "NAME : ${mybody["data"]["first_name"]} ${mybody["data"]["last_name"]}";
                email = "EMAIL : ${mybody["data"]["email"]}";
              });
            },
            icon: const Icon(
              Icons.get_app,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            name,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            email,
          ),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red[900]),
            onPressed: () async {
              var response = await http.delete(
                Uri.parse("https://reqres.in/api/users/1"),
              );
              if (response.statusCode == 204) {
                name = "Name has been deleted";
                email = "Email has been deleted";
              }
            },
            child: const Text(
              "Delete",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
