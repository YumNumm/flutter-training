import 'dart:convert';

import 'package:flutter_training/common/model/result.dart';
import 'package:flutter_training/features/weather/model/fetch_weather_request.dart';
import 'package:flutter_training/features/weather/model/fetch_weather_response.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

class WeatherViewModel {
  WeatherViewModel(
    this._yumemiWeather,
  );

  final YumemiWeather _yumemiWeather;

  Result<FetchWeatherResponse, Exception> fetchThrowsWeather() {
    try {
      final req = FetchWeatherRequest(
        area: 'Tokyo',
        date: DateTime.now().toLocal(),
      );

      final jsonResponse = _yumemiWeather.fetchWeather(jsonEncode(req));
      final weatherResponse = FetchWeatherResponse.fromJson(
        jsonDecode(jsonResponse) as Map<String, dynamic>,
      );
      return Result.success(weatherResponse);
    } on YumemiWeatherError catch (e) {
      switch (e) {
        case YumemiWeatherError.unknown:
          return Result.failure(Exception('不明なエラーが発生しました'));
        case YumemiWeatherError.invalidParameter:
          return Result.failure(Exception('パラメータが不正です'));
      }
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }
}
