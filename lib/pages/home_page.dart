import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_basic/models/summary.dart';
import 'package:flutter_basic/widgets/summary_item.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Summary summary;

  Future getSummary() async {
    var response = await http.get(
      Uri.parse("https://reqres.in/api/users?page=2"),
    );
    Map<String, dynamic> data =
        json.decode(response.body) as Map<String, dynamic>;
    summary = Summary.fromJson(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[900],
        title: const Text(
          "Learning HTTP Request",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: getSummary(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: Text("Loading"),
              );
            }
            if (!snapshot.hasData) {
              return const Center(
                child: Text("No data"),
              );
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SummaryItem(
                  title: "CONFIRMED",
                  value: "${summary.id}",
                ),
                SummaryItem(
                  title: "DEATHS",
                  value: "${summary.id}",
                ),
              ],
            );
          }),
    );
  }
}
