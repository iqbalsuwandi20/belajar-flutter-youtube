import 'package:flutter/material.dart';

class TabIcon extends StatelessWidget {
  final bool active;
  final IconData iconData;

  const TabIcon(
    this.active,
    this.iconData,
  );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: active == true ? Colors.black : Colors.white,
              width: 1,
            ),
          ),
        ),
        child: Icon(iconData),
      ),
    );
  }
}
