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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        centerTitle: true,
        title: const Text(
          "Bottom Sheet",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isDismissible: false,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                builder: (context) => SizedBox(
                  height: 300,
                  // color: Colors.white,
                  child: ListView(
                    children: [
                      ListTile(
                        onTap: () => print("click on photo"),
                        leading: const Icon(Icons.photo),
                        title: const Text("Photo"),
                      ),
                      ListTile(
                        onTap: () => print("click on music"),
                        leading: const Icon(Icons.music_note),
                        title: const Text("Music"),
                      ),
                      ListTile(
                        onTap: () => print("click on video"),
                        leading: const Icon(Icons.video_collection),
                        title: const Text("Video"),
                      ),
                      ListTile(
                        onTap: () => print("click on share"),
                        leading: const Icon(Icons.share),
                        title: const Text("Share"),
                      ),
                      ListTile(
                        onTap: () => Navigator.pop(context),
                        leading: const Icon(Icons.cancel),
                        title: const Text("Cancel"),
                      ),
                    ],
                  ),
                ),
              );
            },
            child: const Text("Show Bottom Sheet"),
          ),
        ),
      ),
    );
  }
}
