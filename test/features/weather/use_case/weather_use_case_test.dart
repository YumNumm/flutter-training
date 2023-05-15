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
import 'package:flutter_training/features/weather/use_case/weather_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

import 'weather_use_case_test.mocks.dart';

void main() {
  final dataSource = MockWeatherDataSource();
  final useCase = FetchWeatherUseCase(dataSource);
  group(
    'WeatherUseCase',
    () {
      test(
        'useCaseを呼び出すと dataSoruceから情報を入手する',
        () {
          final expectedResponse = FetchWeatherResponse(
            weatherCondition: WeatherCondition.sunny,
            date: DateTime(2000),
            maxTemperature: 20,
            minTemperature: 10,
          );
          when(dataSource.fetchWeather(any)).thenReturn(
            expectedResponse,
          );

          final actualResponse = useCase(
            FetchWeatherRequest(
              area: 'London',
              date: DateTime(2000),
            ),
          );

          expect(
            actualResponse,
            Result<FetchWeatherResponse, Exception>.success(expectedResponse),
          );
        },
      );

      test(
        'dataSourceからYumemiWeatherError.unknownが返ってきた場合、例外を返す',
        () {
          // Arrange
          when(dataSource.fetchWeather(any)).thenThrow(
            YumemiWeatherError.unknown,
          );
          // Act
          final actualResponse = useCase(
            FetchWeatherRequest(
              area: 'London',
              date: DateTime(2000),
            ),
          );
          // Assert
          expect(
            actualResponse.errorOrNull,
            isA<Exception>(),
          );
        },
      );
    },
  );
}
