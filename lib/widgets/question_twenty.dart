import 'package:flutter/material.dart';

class QuestionTwenty extends StatelessWidget {
  const QuestionTwenty({
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
      body: Stack(
        children: [
          Container(
            width: 250,
            height: 250,
            color: Colors.green[900],
          ),
          Container(
            width: 200,
            height: 200,
            color: Colors.red[900],
          ),
          Container(
            width: 150,
            height: 150,
            color: Colors.purple[900],
          ),
          Container(
            width: 100,
            height: 100,
            color: Colors.amber[900],
          ),
          Container(
            width: 50,
            height: 50,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
