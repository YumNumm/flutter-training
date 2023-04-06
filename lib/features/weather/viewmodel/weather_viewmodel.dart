import 'package:flutter_training/features/weather/model/weather_condition.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

class WeatherViewModel {
  WeatherViewModel(
    this._yumemiWeather,
  );

  final YumemiWeather _yumemiWeather;

  WeatherCondition? fetchSimpleWeather() {
    final res = _yumemiWeather.fetchSimpleWeather();
    return WeatherCondition.fromString(res);
  }
}
