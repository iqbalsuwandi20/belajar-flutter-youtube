import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:learning_theme/app/routes/app_pages.dart';

import '../../../constant/colors.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'HomeView',
          style: TextStyle(color: appWhite),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text('HomeView is working',
                style: TextStyle(
                  fontSize: 20,
                  color: appBlack,
                )),
          ),
          ElevatedButton(
              onPressed: () => Get.toNamed(Routes.OTHER),
              child: const Text(
                "Go to other",
                style: TextStyle(color: appWhite),
              )),
        ],
      ),
    );
  }
}
