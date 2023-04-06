import 'package:flutter_training/features/weather/model/weather_condition.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

class WeatherViewModel {
  WeatherViewModel();

  final YumemiWeather _yumemiWeather = YumemiWeather();

  WeatherCondition? fetchSimpleWeather() {
    final res = _yumemiWeather.fetchSimpleWeather();
    return WeatherCondition.fromString(res);
  }
}
