import 'dart:math';

import 'package:flutter/material.dart';

class QuestionFour extends StatelessWidget {
  const QuestionFour({
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
        child: Transform.rotate(
          angle: pi / 2,
          child: const FlutterLogo(
            size: 200,
          ),
        ),
      ),
    );
  }
}
