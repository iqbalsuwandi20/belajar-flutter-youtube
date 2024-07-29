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
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: const Text("Tab Bar", style: TextStyle(color: Colors.white)),
          centerTitle: false,
          bottom: const TabBar(
            tabs: [
              Tab(
                child: Icon(
                  Icons.camera,
                  color: Colors.white,
                ),
              ),
              Tab(
                child: Icon(
                  Icons.chat,
                  color: Colors.white,
                ),
              ),
              Tab(
                child: Icon(
                  Icons.update,
                  color: Colors.white,
                ),
              ),
              Tab(
                child: Icon(
                  Icons.call,
                  color: Colors.white,
                ),
              ),
              // Tab(text: "Chats"),
              // Tab(text: "Status"),
              // Tab(text: "Calls"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(
              child: Text("CAMERA"),
            ),
            Center(
              child: Text("CHATS"),
            ),
            Center(
              child: Text("STATUS"),
            ),
            Center(
              child: Text("CALLS"),
            ),
          ],
        ),
      ),
    );
  }
}
