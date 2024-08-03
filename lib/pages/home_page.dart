import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  var faker = Faker();

  String date = DateTime.now().toIso8601String();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    print(faker.person.name());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green[900],
        title: const Text(
          "Package Intl",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
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
    );
  }
}
