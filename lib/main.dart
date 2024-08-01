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
  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();

  String responseResult = "Data not found";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        title: const Text(
          "HTTP Request Put / Patch",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextField(
            controller: nameController,
            autocorrect: false,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Name",
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          TextField(
            controller: jobController,
            autocorrect: false,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Job",
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
            onPressed: () async {
              var response = await http.put(
                Uri.parse("https://reqres.in/api/users/2"),
                body: {
                  "name": nameController.text,
                  "job": jobController.text,
                },
              );

              Map<String, dynamic> data =
                  json.decode(response.body) as Map<String, dynamic>;

              setState(
                () {
                  responseResult = "${data["name"]} - ${data["job"]}";
                },
              );

              print(response.body);
            },
            child: const Text("Submit"),
          ),
          const SizedBox(
            height: 50,
          ),
          Divider(
            color: Colors.red[900],
          ),
          const SizedBox(
            height: 15,
          ),
          Center(
            child: Text(responseResult),
          ),
        ],
      ),
    );
  }
}
