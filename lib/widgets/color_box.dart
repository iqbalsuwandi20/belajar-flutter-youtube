import 'package:flutter/material.dart';

class ColorBox extends StatelessWidget {
  const ColorBox({
    required this.text,
    required this.colors,
    super.key,
  });

  final String text;
  final Color colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      color: colors,
      child: Center(
        child: Text(text),
      ),
    );
  }
}
