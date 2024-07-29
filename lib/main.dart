import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List data = [
    {
      "title": "Option to 1",
      "data": 1,
    },
    {
      "title": "Option to 2",
      "data": 2,
    },
    {
      "title": "Option to 3",
      "data": 3,
    },
  ];

  late int initialData;

  @override
  void initState() {
    initialData = data[0]["data"];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        title: const Text(
          "Drop Down",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: DropdownButton<int>(
            value: initialData,
            items: data
                .map(
                  (e) => DropdownMenuItem(
                    value: e['data'] as int,
                    child: Text("${e["title"]}"),
                  ),
                )
                .toList(),
            onChanged: (value) {
              setState(() {
                initialData = value!;
              });
            },
          ),
        ),
      ),
    );
  }
}
