import 'dart:convert';

import 'package:flutter_training/features/weather/model/fetch_weather_request.dart';
import 'package:flutter_training/features/weather/model/fetch_weather_response.dart';
import 'package:flutter_training/features/weather/model/weather_view_model_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

part 'weather_viewmodel.g.dart';

@Riverpod(keepAlive: true)
YumemiWeather yumemiWeather(YumemiWeatherRef ref) => YumemiWeather();

@riverpod
class WeatherViewModel extends _$WeatherViewModel {
  @override
  WeatherViewModelState build() => const WeatherViewModelState(
        weatherCondition: null,
        maxTemperature: null,
        minTemperature: null,
      );

  void fetchWeather({
    required String area,
    required DateTime date,
  }) {
    final yumemiWeather = ref.read(yumemiWeatherProvider);
    final req = FetchWeatherRequest(
      area: area,
      date: date,
    );
    final jsonResponse = yumemiWeather.fetchWeather(jsonEncode(req));
    final weatherResponse = FetchWeatherResponse.fromJson(
      jsonDecode(jsonResponse) as Map<String, dynamic>,
    );
    state = state.copyWith(
      weatherCondition: weatherResponse.weatherCondition,
      maxTemperature: weatherResponse.maxTemperature,
      minTemperature: weatherResponse.minTemperature,
    );
  }
}
