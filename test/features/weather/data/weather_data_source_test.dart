import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/features/weather/data/weather_data_source.dart';
import 'package:flutter_training/features/weather/model/fetch_weather_request.dart';
import 'package:flutter_training/features/weather/model/fetch_weather_response.dart';
import 'package:flutter_training/features/weather/model/weather_condition.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

@GenerateNiceMocks(
  [
    MockSpec<YumemiWeather>(),
  ],
)
import 'weather_data_source_test.mocks.dart';

void main() {
  final api = MockYumemiWeather();
  final dataSource = WeatherDataSource(api);
  test(
    'Yumemi Weather APIを用いていることの確認',
    () {
      // Arrange
      final expectedResponse = FetchWeatherResponse(
        weatherCondition: WeatherCondition.sunny,
        date: DateTime(2000),
        maxTemperature: 20,
        minTemperature: 10,
      );
      when(api.fetchWeather(any)).thenReturn(
        jsonEncode(
          expectedResponse.toJson(),
        ),
      );
      // Act
      FetchWeatherResponse act() {
        return dataSource.fetchWeather(
          FetchWeatherRequest(
            area: 'London',
            date: DateTime(2000),
          ),
        );
      }

      // Assert
      expect(
        act(),
        expectedResponse,
      );
    },
  );
  test(
    '不正なRequest時にYumemiWeatherError.invalidParameterの例外を出す',
    () {
      // Arrange
      when(api.fetchWeather(any)).thenThrow(
        YumemiWeatherError.invalidParameter,
      );
      // Act
      FetchWeatherResponse actualResponse() => dataSource.fetchWeather(
            FetchWeatherRequest(
              area: 'London',
              date: DateTime(2000),
            ),
          );
      // Assert
      expect(
        actualResponse,
        throwsA(
          YumemiWeatherError.invalidParameter,
        ),
      );
    },
  );
  test(
    'APIエラー発生時にYumemiWeatherError.unknownの例外を出す',
    () {
      // Arrange
      when(api.fetchWeather(any)).thenThrow(
        YumemiWeatherError.unknown,
      );
      // Act
      FetchWeatherResponse actualResponse() => dataSource.fetchWeather(
            FetchWeatherRequest(
              area: 'London',
              date: DateTime(2000),
            ),
          );
      // Assert
      expect(
        actualResponse,
        throwsA(
          YumemiWeatherError.unknown,
        ),
      );
    },
  );
}
