import 'package:flutter/material.dart';
import 'package:flutter_basic/pages/home_page.dart';
import 'package:flutter_basic/pages/page1.dart';
import 'package:flutter_basic/pages/page2.dart';
import 'package:flutter_basic/pages/page3.dart';
import 'package:flutter_basic/pages/page4.dart';
import 'package:flutter_basic/pages/page5.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      // menggunakan routes
      // routes: {
      //   "home": (context) => const HomePage(),
      //   "page_1": (context) => const Page1(),
      //   "page_2": (context) => const Page2(),
      //   "page_3": (context) => const Page3(),
      //   "page_4": (context) => const Page4(),
      //   "page_5": (context) => const Page5(),
      // },

      // menggunakan get routes
      getPages: [
        GetPage(
          name: "/home",
          page: () => const HomePage(),
        ),
        GetPage(
          name: "/page_1",
          page: () => const Page1(),
        ),
        GetPage(
          name: "/page_2",
          page: () => const Page2(),
        ),
        GetPage(
          name: "/page_3",
          page: () => const Page3(),
        ),
        GetPage(
          name: "/page_4",
          page: () => const Page4(),
        ),
        GetPage(
          name: "/page_5",
          page: () => const Page5(),
        ),
      ],
    );
  }
}
