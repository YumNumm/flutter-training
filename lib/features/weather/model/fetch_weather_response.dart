import 'package:flutter_training/features/weather/model/weather_condition.dart';

class FetchWeatherResponse {
  FetchWeatherResponse({
    required this.weatherCondition,
    required this.date,
    required this.maxTemperature,
    required this.minTemperature,
  });

  factory FetchWeatherResponse.fromJson(Map<String, dynamic> json) {
    final weatherCondition =
        WeatherCondition.fromString(json['weather_condition'].toString());
    final date = DateTime.tryParse(json['date'].toString());
    final maxTempreture = int.tryParse(json['max_temperature'].toString());
    final minTempreture = int.tryParse(json['min_temperature'].toString());

    if (weatherCondition == null ||
        date == null ||
        maxTempreture == null ||
        minTempreture == null) {
      throw const FormatException('フォーマットが不正です');
    }

    return FetchWeatherResponse(
      weatherCondition: weatherCondition,
      date: date,
      maxTemperature: maxTempreture,
      minTemperature: minTempreture,
    );
  }

  final WeatherCondition weatherCondition;
  final DateTime date;
  final int maxTemperature;
  final int minTemperature;
}
