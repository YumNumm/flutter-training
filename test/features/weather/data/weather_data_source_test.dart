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

  // Act
  Future<FetchWeatherResponse> act() => dataSource.fetchWeather(
        FetchWeatherRequest(
          area: 'London',
          date: DateTime(2000),
        ),
      );

  test(
    'Yumemi Weather APIを用いていることの確認',
    () async {
      // Arrange
      final expectedResponse = FetchWeatherResponse(
        weatherCondition: WeatherCondition.sunny,
        date: DateTime(2000),
        maxTemperature: 20,
        minTemperature: 10,
      );
      when(api.syncFetchWeather(any)).thenReturn(
        jsonEncode(
          expectedResponse.toJson(),
        ),
      );

      // Assert
      expect(
        await act(),
        expectedResponse,
      );
    },
  );
  test(
    '不正なRequest時にYumemiWeatherError.invalidParameterの例外を出す',
    () {
      // Arrange
      when(api.syncFetchWeather(any)).thenThrow(
        YumemiWeatherError.invalidParameter,
      );
      // Assert
      expect(
        act,
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
      when(api.syncFetchWeather(any)).thenThrow(
        YumemiWeatherError.unknown,
      );
      // Assert
      expect(
        act,
        throwsA(
          YumemiWeatherError.unknown,
        ),
      );
    },
  );
}
