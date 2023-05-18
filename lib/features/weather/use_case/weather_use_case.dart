import 'package:flutter_training/common/model/result.dart';
import 'package:flutter_training/common/use_case/use_case.dart';
import 'package:flutter_training/features/weather/data/weather_data_source.dart';
import 'package:flutter_training/features/weather/model/fetch_weather_request.dart';
import 'package:flutter_training/features/weather/model/fetch_weather_response.dart';
import 'package:flutter_training/features/weather/model/weather_error_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

part 'weather_use_case.g.dart';

@Riverpod(keepAlive: true)
FetchWeatherUseCase fetchWeatherUseCase(FetchWeatherUseCaseRef ref) =>
    FetchWeatherUseCase(
      ref.watch(weatherDataSourceProvider),
    );

class FetchWeatherUseCase extends UseCase<FetchWeatherRequest,
    Result<FetchWeatherResponse, WeatherErrorType>> {
  FetchWeatherUseCase(this._dataSource);
  final WeatherDataSource _dataSource;

  @override
  Result<FetchWeatherResponse, WeatherErrorType> call(
    FetchWeatherRequest param,
  ) {
    try {
      return Result.success(_dataSource.fetchWeather(param));
    } on YumemiWeatherError catch (e) {
      switch (e) {
        case YumemiWeatherError.unknown:
          return const Result.failure(WeatherErrorType.unknown);
        case YumemiWeatherError.invalidParameter:
          return const Result.failure(WeatherErrorType.invalidParameter);
      }
    } on CheckedFromJsonException {
      // JSONからのデシリアライズに失敗した場合
      return const Result.failure(WeatherErrorType.invalidResponse);
    } on FormatException {
      // JSONのパースに失敗した場合
      return const Result.failure(WeatherErrorType.invalidResponse);
    }
  }
}
