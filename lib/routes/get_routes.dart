import 'package:flutter_basic/controllers/counter_controller.dart';
import 'package:flutter_basic/pages/counter_page.dart';
import 'package:get/get.dart';

// ignore: non_constant_identifier_names
GetPage<dynamic> GetRoutes() {
  return GetPage(
    name: "/counter",
    page: () => CounterPage(),
    binding: BindingsBuilder.put(() => CounterController()),
  );
}
