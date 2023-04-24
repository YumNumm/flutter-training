import 'package:flutter_training/common/model/result.dart';
import 'package:flutter_training/features/weather/model/fetch_weather_request.dart';
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
  Result<WeatherViewModelState, Exception> build() => const Result.success(
        WeatherViewModelState(),
      );

  void fetchWeather({
    required String area,
    required DateTime date,
  }) {
    final req = FetchWeatherRequest(
      area: area,
      date: date,
    );
    final useCase = ref.read(fetchWeatherUseCaseProvider);
    state = useCase(req).when(
      success: (data) => Result.success(
        WeatherViewModelState(
          weatherCondition: data.weatherCondition,
          minTemperature: data.minTemperature,
          maxTemperature: data.maxTemperature,
        ),
      ),
      failure: Result.failure,
    );
  }
}
