import 'package:get/get.dart';
import 'package:my_weather_tracker/module/home_controller.dart';
import 'package:my_weather_tracker/repository/weather_repository.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WeatherRepository());
    Get.lazyPut(() => HomeController());
  }
}
