import 'package:dropdown_search/dropdown_search.dart';
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
        centerTitle: true,
        backgroundColor: Colors.green[900],
        title: const Text(
          "Package Dropdown search",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: DropdownSearch<String>(
          popupProps: PopupProps.menu(
            showSelectedItems: true,
            showSearchBox: true,
            disabledItemFn: (String s) => s.startsWith('I'),
          ),
          items: const [
            "Brazil",
            "Italia (Disabled)",
            "Tunisia",
            'Canada',
            'Indonesia',
            'India',
            'Inggris',
          ],
          dropdownDecoratorProps: const DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              labelText: "Menu mode",
              hintText: "country in menu mode",
            ),
          ),
          onChanged: print,
          selectedItem: "Select Now",
        ),
      ),
    );
  }
}
