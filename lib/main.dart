import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_basic/models/user_model.dart';
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
  List<UserModel> allUser = [];

  Future getAllUser() async {
    try {
      var response = await http.get(
        Uri.parse("https://reqres.in/api/users?page=2"),
      );
      // print(response.body);
      List data = (json.decode(response.body) as Map<String, dynamic>)["data"];

      for (var element in data) {
        allUser.add(UserModel.fromJson(element)
            // UserModel(
            //   id: element["id"],
            //   email: element["email"],
            //   firstName: element["first_name"],
            //   lastName: element["last_name"],
            //   avatar: element["avatar"],
            // ),
            );
      }

      print(allUser);
    } catch (e) {
      // error
      print("Error occurred");
      print(e);
    }
    // await Future.delayed(
    //   const Duration(seconds: 5),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text(
          "Model",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: getAllUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: Text("Loading"),
            );
          } else {
            if (allUser.isEmpty) {
              return const Center(
                child: Text("Data not found"),
              );
            }
            return ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: allUser.length,
              itemBuilder: (context, index) => ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey[300],
                  backgroundImage: NetworkImage(
                    allUser[index].avatar,
                  ),
                ),
                title: Text(
                  "${allUser[index].firstName} ${allUser[index].lastName}",
                ),
                subtitle: Text(
                  allUser[index].email,
                ),
              ),
            );
          }
        },
      ),
      // body: Center(
      //   child: ElevatedButton(
      //     style: ElevatedButton.styleFrom(
      //       backgroundColor: Colors.green[900],
      //     ),
      //     onPressed: () async {
      //       // get data url api
      //       var response = await http.get(
      //         Uri.parse("https://reqres.in/api/users?page=2"),
      //       );
      //       List data =
      //           (json.decode(response.body) as Map<String, dynamic>)["data"];
      //       for (var element in data) {
      //         Map<String, dynamic> user = element;
      //         print(user["first_name"]);
      //         print(user["id"]);
      //         print(user["email"]);
      //         print(user["avatar"]);
      //       }
      //       // print(data[0]);
      //     },
      //     child: const Text(
      //       "Click this one",
      //       style: TextStyle(color: Colors.white),
      //     ),
      //   ),
      // ),
    );
  }
}
