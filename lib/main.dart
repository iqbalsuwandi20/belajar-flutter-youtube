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
          "Drawer",
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.all(20),
              height: 100,
              width: double.infinity,
              color: Colors.blue,
              child: const Text(
                "Dashboard Menu",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  ListTile(
                    onTap: () {
                      print("Menu Home");
                    },
                    leading: const Icon(Icons.home),
                    title: const Text("Home"),
                    trailing: const Icon(Icons.arrow_forward),
                  ),
                  ListTile(
                    onTap: () {
                      print("Menu Product");
                    },
                    leading: const Icon(Icons.shopping_cart),
                    title: const Text("Cart"),
                    trailing: const Icon(Icons.arrow_forward),
                  ),
                  ListTile(
                    onTap: () {
                      print("Menu Home");
                    },
                    leading: const Icon(Icons.home),
                    title: const Text("Home"),
                    trailing: const Icon(Icons.arrow_forward),
                  ),
                  ListTile(
                    onTap: () {
                      print("Menu Product");
                    },
                    leading: const Icon(Icons.shopping_cart),
                    title: const Text("Cart"),
                    trailing: const Icon(Icons.arrow_forward),
                  ),
                  ListTile(
                    onTap: () {
                      print("Menu Home");
                    },
                    leading: const Icon(Icons.home),
                    title: const Text("Home"),
                    trailing: const Icon(Icons.arrow_forward),
                  ),
                  ListTile(
                    onTap: () {
                      print("Menu Product");
                    },
                    leading: const Icon(Icons.shopping_cart),
                    title: const Text("Cart"),
                    trailing: const Icon(Icons.arrow_forward),
                  ),
                  ListTile(
                    onTap: () {
                      print("Menu Home");
                    },
                    leading: const Icon(Icons.home),
                    title: const Text("Home"),
                    trailing: const Icon(Icons.arrow_forward),
                  ),
                  ListTile(
                    onTap: () {
                      print("Menu Product");
                    },
                    leading: const Icon(Icons.shopping_cart),
                    title: const Text("Cart"),
                    trailing: const Icon(Icons.arrow_forward),
                  ),
                  ListTile(
                    onTap: () {
                      print("Menu Home");
                    },
                    leading: const Icon(Icons.home),
                    title: const Text("Home"),
                    trailing: const Icon(Icons.arrow_forward),
                  ),
                  ListTile(
                    onTap: () {
                      print("Menu Product");
                    },
                    leading: const Icon(Icons.shopping_cart),
                    title: const Text("Cart"),
                    trailing: const Icon(Icons.arrow_forward),
                  ),
                  ListTile(
                    onTap: () {
                      print("Menu Home");
                    },
                    leading: const Icon(Icons.home),
                    title: const Text("Home"),
                    trailing: const Icon(Icons.arrow_forward),
                  ),
                  ListTile(
                    onTap: () {
                      print("Menu Product");
                    },
                    leading: const Icon(Icons.shopping_cart),
                    title: const Text("Cart"),
                    trailing: const Icon(Icons.arrow_forward),
                  ),
                  ListTile(
                    onTap: () {
                      print("Menu Home");
                    },
                    leading: const Icon(Icons.home),
                    title: const Text("Home"),
                    trailing: const Icon(Icons.arrow_forward),
                  ),
                  ListTile(
                    onTap: () {
                      print("Menu Product");
                    },
                    leading: const Icon(Icons.shopping_cart),
                    title: const Text("Cart"),
                    trailing: const Icon(Icons.arrow_forward),
                  ),
                  ListTile(
                    onTap: () {
                      print("Menu Home");
                    },
                    leading: const Icon(Icons.home),
                    title: const Text("Home"),
                    trailing: const Icon(Icons.arrow_forward),
                  ),
                  ListTile(
                    onTap: () {
                      print("Menu Product");
                    },
                    leading: const Icon(Icons.shopping_cart),
                    title: const Text("Cart"),
                    trailing: const Icon(Icons.arrow_forward),
                  ),
                  ListTile(
                    onTap: () {
                      print("Menu Home");
                    },
                    leading: const Icon(Icons.home),
                    title: const Text("Home"),
                    trailing: const Icon(Icons.arrow_forward),
                  ),
                  ListTile(
                    onTap: () {
                      print("Menu Product");
                    },
                    leading: const Icon(Icons.shopping_cart),
                    title: const Text("Cart"),
                    trailing: const Icon(Icons.arrow_forward),
                  ),
                  ListTile(
                    onTap: () {
                      print("Menu Home");
                    },
                    leading: const Icon(Icons.home),
                    title: const Text("Home"),
                    trailing: const Icon(Icons.arrow_forward),
                  ),
                  ListTile(
                    onTap: () {
                      print("Menu Product");
                    },
                    leading: const Icon(Icons.shopping_cart),
                    title: const Text("Cart"),
                    trailing: const Icon(Icons.arrow_forward),
                  ),
                  ListTile(
                    onTap: () {
                      print("Menu Home");
                    },
                    leading: const Icon(Icons.home),
                    title: const Text("Home"),
                    trailing: const Icon(Icons.arrow_forward),
                  ),
                  ListTile(
                    onTap: () {
                      print("Menu Product");
                    },
                    leading: const Icon(Icons.shopping_cart),
                    title: const Text("Cart"),
                    trailing: const Icon(Icons.arrow_forward),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
