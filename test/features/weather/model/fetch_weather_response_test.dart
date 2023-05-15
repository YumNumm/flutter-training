import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/features/weather/model/fetch_weather_response.dart';

import 'fetch_weather_response_fixture.dart';

void main() {
  group(
    'FetchWeatherResponse',
    () {
      test(
        'fromJson',
        () {
          final responseWithJsons =
              FetchWeatherResponseFixture.factory.makeManyWithJsonArray(100);
          for (final response in responseWithJsons) {
            final actual = FetchWeatherResponse.fromJson(response.json);
            final expected = response.object;
            expect(actual, expected);
          }
        },
      );
      test(
        'toJson',
        () {
          final responseWithJsons =
              FetchWeatherResponseFixture.factory.makeManyWithJsonArray(100);
          for (final response in responseWithJsons) {
            final actual = response.object.toJson();
            final expected = response.json;
            expect(actual, expected);
          }
        },
      );

      test(
        'WeatherConditionが存在しなかった場合',
        () {
          // Arrange
          const json = <String, dynamic>{
            'weather_condition': 'invalid',
            'date': '2000-01-01',
            'max_temperature': 10,
            'min_temperature': 5,
          };
          // Act
          FetchWeatherResponse act() => FetchWeatherResponse.fromJson(json);
          // Assert
          expect(
            act,
            throwsException,
          );
        },
      );
      test(
        'weather_conditionがKeyにない場合',
        () {
          // Arrange
          const json = <String, dynamic>{
            // 'weather_condition': 'sunny',
            'date': '2000-01-01',
            'max_temperature': 10,
            'min_temperature': 5,
          };
          // Act
          FetchWeatherResponse act() => FetchWeatherResponse.fromJson(json);
          // Assert
          expect(
            act,
            throwsException,
          );
        },
      );

      test(
        'dateがKeyにない場合',
        () {
          // Arrange
          const json = <String, dynamic>{
            'weather_condition': 'sunny',
            // 'date': '2000-01-01',
            'max_temperature': 10,
            'min_temperature': 5,
          };
          // Act
          FetchWeatherResponse act() => FetchWeatherResponse.fromJson(json);
          // Assert
          expect(
            act,
            throwsException,
          );
        },
      );

      test(
        'max_temperatureがKeyにない場合',
        () {
          // Arrange
          const json = <String, dynamic>{
            'weather_condition': 'sunny',
            'date': '2000-01-01',
            // 'max_temperature': 10,
            'min_temperature': 5,
          };
          // Act
          FetchWeatherResponse act() => FetchWeatherResponse.fromJson(json);
          // Assert
          expect(
            act,
            throwsException,
          );
        },
      );

      test(
        'min_temperatureがKeyにない場合',
        () {
          // Arrange
          const json = <String, dynamic>{
            'weather_condition': 'sunny',
            'date': '2000-01-01',
            'max_temperature': 10,
            // 'min_temperature': 5,
          };
          // Act
          FetchWeatherResponse act() => FetchWeatherResponse.fromJson(json);
          // Assert
          expect(
            act,
            throwsException,
          );
        },
      );
    },
  );
}
