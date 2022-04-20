import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_weather_tracker/module/home_binding.dart';
import 'package:my_weather_tracker/module/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'My Weather Tracker',
      getPages: [
        GetPage(name: '/', page: () => HomePage(), binding: HomeBinding())
      ],
    );
  }
}
