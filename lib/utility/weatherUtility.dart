import 'dart:convert';

import 'package:acquire/structure/weather_data.dart';
import "package:geolocator/geolocator.dart";
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;

class WeatherUtility {
  static const String providerUrl = 'http://api.openweathermap.org/data/2.5/weather';
  final String apiKey;

  WeatherUtility(this.apiKey);

  Future<WeatherData?> getWeatherData(String city) async {
    final res = await http.get(Uri.parse('$providerUrl?q=$city&APPID=$apiKey&units=metric'));

    if (res.statusCode == 200) {
      return WeatherData.fromJson(jsonDecode(res.body));
    } else {
      throw Exception('Unable to fetch weather data from provider');
    }
  }

  Future<String> currentCity() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    List<Placemark> placemark = await placemarkFromCoordinates(position.latitude, position.longitude);

    String? city = placemark[0].locality;

    return city ?? "";
  }
}
