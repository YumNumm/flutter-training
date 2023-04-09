import 'package:flutter/material.dart';
import 'package:flutter_training/features/weather/model/result.dart';
import 'package:flutter_training/features/weather/model/weather_condition.dart';
import 'package:go_router/go_router.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

class WeatherViewModel {
  WeatherViewModel(
    this._yumemiWeather,
  );

  final YumemiWeather _yumemiWeather;

  Result<WeatherCondition, Exception> fetchThrowsWeather() {
    try {
      final res = _yumemiWeather.fetchThrowsWeather('Tokyo');
      final weatherCondition = WeatherCondition.fromString(res);
      if (weatherCondition == null) {
        return Result.failure(Exception('天気の取得に失敗しました'));
      }
      return Result.success(weatherCondition);
    } on YumemiWeatherError catch (e) {
      switch (e) {
        case YumemiWeatherError.unknown:
          return Result.failure(Exception('不明なエラーが発生しました'));
        case YumemiWeatherError.invalidParameter:
          return Result.failure(Exception('パラメータが不正です'));
      }
    }
  }

  Future<void> showErrorDialog({
    required BuildContext context,
    required String title,
    required String message,
  }) =>
      showDialog<void>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () => context.pop(),
                child: const Text('Close'),
              ),
            ],
          );
        },
      );
}
