import 'dart:convert';

import 'package:flutter_training/common/model/result.dart';
import 'package:flutter_training/features/weather/model/fetch_weather_request.dart';
import 'package:flutter_training/features/weather/model/fetch_weather_response.dart';
import 'package:flutter_training/features/weather/model/weather_view_model_state.dart';
import 'package:flutter_training/features/weather/viewmodel/weather_screen_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

part 'weather_viewmodel.g.dart';

@Riverpod(keepAlive: true)
YumemiWeather yumemiWeather(YumemiWeatherRef ref) => YumemiWeather();

final weatherViewModelProvider = Provider(WeatherViewModel.new);

class WeatherViewModel {
  WeatherViewModel(this.ref);
  final Ref ref;

  void fetchWeather({
    required String area,
    required DateTime date,
  }) {
    final yumemiWeather = ref.read(yumemiWeatherProvider);
    try {
      final req = FetchWeatherRequest(
        area: area,
        date: date,
      );
      final jsonResponse = yumemiWeather.fetchWeather(jsonEncode(req));
      final weatherResponse = FetchWeatherResponse.fromJson(
        jsonDecode(jsonResponse) as Map<String, dynamic>,
      );
      ref.read(weatherScreenStateProvider.notifier).state = Result.success(
        WeatherScreenState(
          weatherCondition: weatherResponse.weatherCondition,
          maxTemperature: weatherResponse.maxTemperature,
          minTemperature: weatherResponse.minTemperature,
        ),
      );
    } on YumemiWeatherError catch (e) {
      switch (e) {
        case YumemiWeatherError.unknown:
          return _updateWeatherScreenStateException(Exception('不明なエラーが発生しました'));
        case YumemiWeatherError.invalidParameter:
          return _updateWeatherScreenStateException(Exception('パラメータが不正です'));
      }
    } on FormatException {
      // jsonDecode() でエラーが発生した場合
      return _updateWeatherScreenStateException(Exception('レスポンスのフォーマットが不正です'));
    }
  }

  // WeatherScreenStateにException情報を渡す
  void _updateWeatherScreenStateException(Exception error) {
    ref.read(weatherScreenStateProvider.notifier).state = Result.failure(
      error,
    );
  }
}
