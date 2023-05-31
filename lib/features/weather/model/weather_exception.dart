import 'package:flutter_training/features/weather/model/weather_error_type.dart';

class WeatherExcepiton implements Exception {
  const WeatherExcepiton(this.type);
  final WeatherErrorType type;

  @override
  String toString() => type.message;
}
