import 'package:flutter/material.dart';

class QuestionTwentytwo extends StatelessWidget {
  const QuestionTwentytwo({
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
      body: Center(
        child: Container(
          width: 250,
          height: 250,
          decoration: BoxDecoration(
            color: Colors.grey,
            border: Border.all(
              color: Colors.blue,
              width: 10,
            ),
            borderRadius: BorderRadius.circular(250 / 2),
            image: const DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                "https://picsum.photos/500/500",
              ),
            ),
          ),
        ),
      ),
    );
  }
}
