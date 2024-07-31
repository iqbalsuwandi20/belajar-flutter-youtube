import 'package:flutter/material.dart';

class StoryItem extends StatelessWidget {
  final String title;

  const StoryItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.grey[300],
                ),
              ),
              Container(
                height: 77,
                width: 77,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.grey[300],
                  border: Border.all(
                    color: Colors.white,
                    width: 5,
                  ),
                  image: const DecorationImage(
                    image: NetworkImage(
                      "https://picsum.photos/536/354",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Text(title),
        ],
      ),
    );
  }
}
