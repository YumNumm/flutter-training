import 'package:flutter_training/features/weather/model/weather_condition.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'fetch_weather_response.freezed.dart';
part 'fetch_weather_response.g.dart';

@freezed
class FetchWeatherResponse with _$FetchWeatherResponse {
  factory FetchWeatherResponse({
    required WeatherCondition weatherCondition,
    required DateTime date,
    required int maxTemperature,
    required int minTemperature,
  }) = _FetchWeatherResponse;
  factory FetchWeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$FetchWeatherResponseFromJson(json);
}
