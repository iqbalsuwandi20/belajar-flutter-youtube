import 'package:flutter/material.dart';

class QuestionEighteen extends StatelessWidget {
  const QuestionEighteen({
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
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: 50,
        itemBuilder: (context, index) {
          if (index % 2 == 0) {
            return Padding(
              padding: const EdgeInsets.only(
                bottom: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 150,
                    color: Colors.blue[900],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Hello ${index + 1}",
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.only(
                bottom: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 150,
                    color: Colors.amber[900],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Hello ${index + 1}",
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
