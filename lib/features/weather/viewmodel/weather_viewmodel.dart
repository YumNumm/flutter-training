import 'package:flutter_training/common/extension/async_value_guard.dart';
import 'package:flutter_training/features/weather/model/fetch_weather_request.dart';
import 'package:flutter_training/features/weather/model/weather_exception.dart';
import 'package:flutter_training/features/weather/model/weather_view_model_state.dart';
import 'package:flutter_training/features/weather/use_case/weather_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

part 'weather_viewmodel.g.dart';

@Riverpod(keepAlive: true)
YumemiWeather yumemiWeather(YumemiWeatherRef ref) => YumemiWeather();

@riverpod
class WeatherViewModel extends _$WeatherViewModel {
  @override
  AsyncValue<WeatherViewModelState?> build() => const AsyncData(null);

  Future<void> fetchWeather({
    required String area,
    required DateTime date,
  }) async {
    // 既に読み込み中の場合は何もしない
    if (state.isLoading) {
      return;
    }
    final req = FetchWeatherRequest(
      area: area,
      date: date,
    );
    final useCase = ref.read(fetchWeatherUseCaseProvider);
    state =
        const AsyncLoading<WeatherViewModelState?>().copyWithPrevious(state);
    state = await state.preservedGuard(() async {
      final res = await useCase.call(req);
      return res.when(
        success: (data) => WeatherViewModelState(
          minTemperature: data.minTemperature,
          maxTemperature: data.maxTemperature,
          weatherCondition: data.weatherCondition,
        ),
        failure: (error) => throw WeatherExcepiton(error),
      );
    });
  }
}
