import 'package:get/get.dart';
import 'package:my_weather_tracker/data/location_data.dart';
import 'package:my_weather_tracker/data/weather_data.dart';
import 'package:my_weather_tracker/repository/weather_repository.dart';

class HomeController extends GetxController {
  final WeatherRepository _repository = Get.find();

  // A nullable Rx instance of LocationData. Initial value is null.
  Rxn<LocationData> locationData = Rxn();

  // A nullable Rx instance of WeatherData. Initial value is null.
  Rxn<WeatherData> weatherData = Rxn();

  // A reactive String to display informative text.
  RxString infoText = '...'.obs;

  String get address =>
      "${locationData.value?.regionName}, ${locationData.value?.country}";

  // Preparing the temperature String to show in the Widget
  String get temperature => "${weatherData.value?.temp}";

  @override
  void onInit() async {
    super.onInit();
    await getCurrentLocation();
    // Order is important! We need to wait for the location before fetching the temperature.
    await getTemperatureForCurrentLocation();
  }

  getCurrentLocation() async {
    LocationData? location = await _repository.getCurrentLocation();
    print(location?.regionName);
    // We assign the response from our API call to our Rx object.
    locationData.value = location;
  }

  getTemperatureForCurrentLocation() async {
    // Verify if location is not null first
    if (locationData.value != null) {
      // We assign the response from our API call to our Rx object.
      weatherData.value =
          await _repository.getWeatherForLocation(locationData.value!);
      _getInfoText(weatherData.value?.temp);
    }
  }

  _getInfoText(int? temperature) {
    if (temperature == null) {
      infoText.value = "unknown";
    } else if (temperature <= 0) {
      infoText.value =
          "make sure to dress thick cloths! It's freezing out there!";
    } else if (temperature <= 15) {
      infoText.value = "wear a jacket, don't catch a cold!";
    } else {
      infoText.value = "enjoy the weather, it's nice!";
    }
  }
}
