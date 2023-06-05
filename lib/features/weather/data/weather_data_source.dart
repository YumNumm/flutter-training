import 'dart:convert';
import 'dart:isolate';

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
  WeatherDataSource(this._yumemiWeather);
  final YumemiWeather _yumemiWeather;

  Future<FetchWeatherResponse> fetchWeather(FetchWeatherRequest request) async {
    final weatherResponse = await Isolate.run(() async {
      final response = _yumemiWeather.syncFetchWeather(
        jsonEncode(request),
      );
      return FetchWeatherResponse.fromJson(
        jsonDecode(response) as Map<String, dynamic>,
      );
    });
    return weatherResponse;
  }
}
