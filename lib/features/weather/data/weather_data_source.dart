import 'dart:convert';

import 'package:flutter_training/features/weather/model/fetch_weather_request.dart';
import 'package:flutter_training/features/weather/model/fetch_weather_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

part 'weather_data_source.g.dart';

@Riverpod(keepAlive: true)
YumemiWeather yumemiWeather(YumemiWeatherRef ref) => YumemiWeather();

@Riverpod(keepAlive: true)
WeatherDataSource weatherDataSource(WeatherDataSourceRef ref) =>
    WeatherDataSource(
      ref.watch(yumemiWeatherProvider),
    );

class WeatherDataSource {
  WeatherDataSource(this.yumemiWeather);
  final YumemiWeather yumemiWeather;

  FetchWeatherResponse fetchWeather(FetchWeatherRequest request) {
    final jsonResponse = yumemiWeather.fetchWeather(jsonEncode(request));
    final weatherResponse = FetchWeatherResponse.fromJson(
      jsonDecode(jsonResponse) as Map<String, dynamic>,
    );
    return weatherResponse;
  }
}
