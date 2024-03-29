@GenerateNiceMocks(
  [
    MockSpec<WeatherDataSource>(),
  ],
)
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/common/model/result.dart';
import 'package:flutter_training/features/weather/data/weather_data_source.dart';
import 'package:flutter_training/features/weather/model/fetch_weather_request.dart';
import 'package:flutter_training/features/weather/model/fetch_weather_response.dart';
import 'package:flutter_training/features/weather/model/weather_condition.dart';
import 'package:flutter_training/features/weather/model/weather_error_type.dart';
import 'package:flutter_training/features/weather/use_case/weather_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

import 'weather_use_case_test.mocks.dart';

void main() {
  final dataSource = MockWeatherDataSource();
  final useCase = FetchWeatherUseCase(dataSource);

  // Act
  Future<Result<FetchWeatherResponse, WeatherErrorType>> act() => useCase.call(
        FetchWeatherRequest(
          area: 'London',
          date: DateTime(2000),
        ),
      );

  test(
    'useCaseを呼び出すと dataSoruceから情報を入手する',
    () async {
      final expectedWeatherResponse = FetchWeatherResponse(
        weatherCondition: WeatherCondition.sunny,
        date: DateTime(2000),
        maxTemperature: 20,
        minTemperature: 10,
      );
      // expectedWeatherResponseをResult.successでラップする
      final expectedResponse =
          Result<FetchWeatherResponse, WeatherErrorType>.success(
        expectedWeatherResponse,
      );
      when(dataSource.fetchWeather(any)).thenAnswer(
        (_) => Future.value(expectedWeatherResponse),
      );

      // Assert
      expect(
        await act(),
        expectedResponse,
      );
    },
  );

  test(
    'dataSourceからYumemiWeatherError.unknownが返ってきた場合 正しいErrorTypeのResultを返す',
    () async {
      // Arrange
      when(dataSource.fetchWeather(any)).thenThrow(
        YumemiWeatherError.unknown,
      );
      const expectedResponse =
          Result<FetchWeatherResponse, WeatherErrorType>.failure(
        WeatherErrorType.unknown,
      );
      // Assert
      expect(
        await act(),
        expectedResponse,
      );
    },
  );
  test(
    'dataSourceでJSONのデシリアライズに失敗した場合 正しいErrorTypeのResultを返す',
    () async {
      when(dataSource.fetchWeather(any)).thenThrow(
        CheckedFromJsonException(
          {},
          null,
          'className',
          'A value must be provided. Supported values: sunny, cloudy, rainy',
        ),
      );
      const expectedResponse =
          Result<FetchWeatherResponse, WeatherErrorType>.failure(
        WeatherErrorType.invalidResponse,
      );
      // Assert
      expect(
        await act(),
        expectedResponse,
      );
    },
  );
  test(
    'dataSourceでJSONパースに失敗した場合 正しいErrorTypeのResultを返す',
    () async {
      when(dataSource.fetchWeather(any)).thenThrow(
        const FormatException(),
      );
      const expectedResponse =
          Result<FetchWeatherResponse, WeatherErrorType>.failure(
        WeatherErrorType.invalidResponse,
      );
      // Assert
      expect(
        await act(),
        expectedResponse,
      );
    },
  );
}
