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
  late String id;
  late String email;
  late String name;

  @override
  void initState() {
    id = "id not found";
    email = "email not found";
    name = "name not found";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        title: const Text(
          "HTTP Request Get",
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
              "ID : $id",
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              "EMAIL : $email",
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              "NAME : $name",
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[900],
              ),
              onPressed: () async {
                var myResponse = await http.get(
                  Uri.parse("https://reqres.in/api/users/3"),
                );
                if (myResponse.statusCode == 200) {
                  // successfully get data
                  print("successfully get data");
                  Map<String, dynamic> data =
                      json.decode(myResponse.body) as Map<String, dynamic>;
                  setState(() {
                    id = data["data"]["id"].toString();
                    email = data["data"]["email"].toString();
                    name =
                        "${data["data"]["first_name"]} ${data["data"]["last_name"]}";
                    // body = myResponse.body;
                  });
                } else {
                  // unsuccessful get data
                  print("ERROR ${myResponse.statusCode}");
                  // setState(() {
                  //   body = "ERROR ${myResponse.statusCode}";
                  // });
                }
                // print(myResponse.statusCode);
                // print("-----------");
                // print(myResponse.headers);
                // print("-----------");
                // print(myResponse.body);
              },
              child: const Text(
                "GET data",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
