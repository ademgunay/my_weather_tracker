import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:my_weather_tracker/data/location_data.dart';
import 'package:my_weather_tracker/data/weather_data.dart';

class WeatherRepository {
  final apiKey = "PUT_YOUR_API_KEY_HERE";

  Future<LocationData?> getCurrentLocation() async {
    LocationData? locationData;
    var url = Uri.http('ip-api.com', '/json');
    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      // We use the json decoded response and apply to our .fromJson function
      locationData = LocationData.fromJson(jsonResponse);
      print('Request successful: $jsonResponse');
      return locationData;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return locationData;
    }
  }

  Future<WeatherData?> getWeatherForLocation(LocationData location) async {
    WeatherData? weather;
    // The parameters required by the API to give us what we need
    var params = {
      'lat': location.lat.toString(),
      'lon': location.lon.toString(),
      'city': location.regionName,
      'appId': apiKey,
    };
    var url = Uri.http('api.openweathermap.org', '/data/2.5/weather', params);
    // Await the http get response, then decode the json-formatted response.
    Response response = await http.get(
      url,
    );
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      // We use the json decoded response and apply to our .fromJson function
      weather = WeatherData.fromJson(jsonResponse);
      print('Request successful: $jsonResponse');
      return weather;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return weather;
    }
  }
}
