import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var faker = Faker();

  String date = DateTime.now().toIso8601String();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [
      ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: 50,
        itemBuilder: (context, index) => ListTile(
          leading: const CircleAvatar(
            backgroundColor: Colors.grey,
            backgroundImage: NetworkImage(
              "https://picsum.photos/id/237/200/300",
            ),
          ),
          title: Text(faker.person.name()),
          // subtitle:Text(DateFormat.yMMMMEEEEd().add_jms().format(DateTime.now())),
          subtitle: Text(
            DateFormat.yMMMMEEEEd().add_jms().format(DateTime.parse(date)),
          ),
        ),
      ),
      const Center(
        child: Text("Menu 2"),
      ),
      const Center(
        child: Text("Menu 3"),
      ),
      const Center(
        child: Text("Menu 4"),
      ),
      const Center(
        child: Text("Menu 5"),
      ),
    ];

    print(faker.person.name());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green[900],
        title: const Text(
          "Package Bottom Navigation Bar",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: widgets[currentIndex],
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Colors.green[900],
        color: Colors.white,
        style: TabStyle.textIn,
        items: const [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.map, title: 'Discovery'),
          TabItem(icon: Icons.add, title: 'Add'),
          TabItem(icon: Icons.message, title: 'Message'),
          TabItem(icon: Icons.people, title: 'Profile'),
        ],
        initialActiveIndex: 0,
        onTap: (int i) {
          setState(() {
            currentIndex = i;
          });
        },
        // onTap: (int i) => print('click index=$i'),
      ),
    );
  }
}
