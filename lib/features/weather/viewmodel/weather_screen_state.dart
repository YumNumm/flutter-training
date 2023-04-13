import 'package:flutter_training/common/model/result.dart';
import 'package:flutter_training/features/weather/model/weather_view_model_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final StateProvider<Result<WeatherScreenState, dynamic>>
    weatherScreenStateProvider = StateProvider(
  (ref) => const Result.success(
    WeatherScreenState(
      weatherCondition: null,
      maxTemperature: null,
      minTemperature: null,
    ),
  ),
);
