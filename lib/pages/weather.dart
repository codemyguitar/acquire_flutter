import 'package:acquire/structure/weather_data.dart';
import 'package:acquire/utility/weatherUtility.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class WeatherViewPage extends StatefulWidget {
  const WeatherViewPage({super.key});

  @override
  State<WeatherViewPage> createState() => _WeatherViewPageState();
}

class _WeatherViewPageState extends State<WeatherViewPage> {
  final _weatherUtility = WeatherUtility('7547e74ddc899fb37e48de8c530bfb24');

  WeatherData? _weatherData;
  late bool _loading;

  _getWeatherData() async {
    String city = await _weatherUtility.currentCity();

    try {
      final weather = await _weatherUtility.getWeatherData(city);

      setState(() {
        _loading = false;
        _weatherData = weather;
      });
    } catch (error) {
      throw Exception('Unable to fetch weather data from provider');
    }
  }

  String weatherCondition(String? condition) {
    switch (condition?.toLowerCase()) {
      case 'clouds':
      case 'mist':
      case 'smoke':
      case 'haze':
      case 'dust':
      case 'fog':
        return 'assets/weather-cloudy.json';
      case 'rain':
      case 'drizzle':
      case 'shower rain':
        return 'assets/weather-rainy.json';
      case 'thunderstorm':
        return 'assets/weather-thunder.json';
      case 'clear':
        return 'assets/weather-sunny.json';
      default:
        return 'assets/weather-sunny.json';
    }
  }

  @override
  void initState() {
    super.initState();

    _loading = true;
    _getWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _loading = true;
            _getWeatherData();
          });
        },
        child: const Icon(Icons.refresh),
      ),
      body: Center(
        child: _loading
            ? const Padding(
                padding: const EdgeInsets.all(100.0),
                child: const LoadingIndicator(
                  indicatorType: Indicator.circleStrokeSpin,
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(_weatherData?.condition ?? ""),
                  Lottie.asset(weatherCondition(_weatherData?.condition)),
                  Text(_weatherData?.city ?? 'getting city...'),
                  Text('${_weatherData?.temp.round()} Celcius'),
                ],
              ),
      ),
    );
  }
}
