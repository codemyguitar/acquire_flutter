class WeatherData {
  String city;
  double temp;
  String condition;

  WeatherData({required this.city, required this.temp, required this.condition});

  factory WeatherData.fromJson(Map<String, dynamic> data) {
    return WeatherData(city: data['name'], temp: data['main']['temp'].toDouble(), condition: data['weather'][0]['main']);
  }
}
