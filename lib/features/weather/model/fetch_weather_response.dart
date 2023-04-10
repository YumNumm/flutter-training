import 'package:flutter_training/features/weather/model/weather_condition.dart';

class FetchWeatherResponse {
  FetchWeatherResponse({
    required this.weatherCondition,
    required this.date,
    required this.maxTemperature,
    required this.minTemperature,
  });

  factory FetchWeatherResponse.fromJson(Map<String, dynamic> json) =>
      FetchWeatherResponse(
        weatherCondition:
            WeatherCondition.fromString(json['weather_condition'] as String)!,
        date: DateTime.parse(json['date'] as String),
        maxTemperature: json['max_temperature'] as int,
        minTemperature: json['min_temperature'] as int,
      );

  final WeatherCondition weatherCondition;
  final DateTime date;
  final int maxTemperature;
  final int minTemperature;
}
