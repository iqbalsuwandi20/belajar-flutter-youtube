import 'package:flutter/material.dart';

class QuestionSeven extends StatelessWidget {
  const QuestionSeven({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        leading: const FlutterLogo(),
        title: const Text("Basic Flutter Training"),
        actions: [
          IconButton(
            onPressed: () {
              print("CLICK ON TEST");
            },
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Row(
        children: [
          Container(
            width: 150,
            height: 150,
            color: Colors.blue[900],
            child: const Center(
              child: Text(
                "Seven",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 25,
          ),
          Container(
            width: 150,
            height: 150,
            color: Colors.amber[900],
            child: const Center(
              child: Text(
                "Seven",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
