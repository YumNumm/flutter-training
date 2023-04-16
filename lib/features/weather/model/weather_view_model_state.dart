import 'package:flutter_training/features/weather/model/weather_condition.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_view_model_state.freezed.dart';

@freezed
class WeatherViewModelState with _$WeatherViewModelState {
  const factory WeatherViewModelState({
    WeatherCondition? weatherCondition,
    int? maxTemperature,
    int? minTemperature,
  }) = _WeatherViewModelState;
}
