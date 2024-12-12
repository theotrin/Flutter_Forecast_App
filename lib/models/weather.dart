import 'package:flutter_forecast/models/forecast.dart';

class Weather {
  final int temp;
  final String date;
  final String time;
  final String description;
  final String currently;
  final String cityName;
  final String windSpeedy;
  final int humidity;
  final List<Forecast> forecast;

  Weather({
    required this.temp,
    required this.date,
    required this.time,
    required this.description,
    required this.currently,
    required this.cityName,
    required this.windSpeedy,
    required this.humidity,
    required this.forecast,
  });

  factory Weather.defaultValues() {
    return Weather(
      temp: 0,
      date: "01/01/2000",
      time: "00:00",
      description: "No data",
      currently: "unknown",
      cityName: "Unknown",
      windSpeedy: "0 km/h",
      humidity: 0,
      forecast: [Forecast.defaultValues()],
    );
  }

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      temp: json['results']['temp'],
      date: json['results']['date'],
      time: json['results']['time'],
      description: json['results']['description'],
      currently: json['results']['currently'],
      cityName: json['results']['city_name'],
      windSpeedy: json['results']['wind_speedy'],
      humidity: json['results']['humidity'],
      forecast: (json['results']['forecast'] as List)
          .map((e) => Forecast.fromJson(e))
          .toList(),
    );
  }
}
