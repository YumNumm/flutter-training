import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/features/weather/model/fetch_weather_response.dart';
import 'package:flutter_training/features/weather/model/weather_condition.dart';

void main() {
  group(
    'FetchWeatherResponse',
    () {
      test(
        '正しいJSONファイルからインスタンスが生成される',
        () {
          // Arrange
          const json = <String, dynamic>{
            'weather_condition': 'sunny',
            'date': '2021-01-01',
            'max_temperature': 10,
            'min_temperature': 5,
          };
          // Act
          final actual = FetchWeatherResponse.fromJson(json);
          // Assert
          expect(actual.weatherCondition, WeatherCondition.sunny);
          expect(actual.date, DateTime(2021));
          expect(actual.maxTemperature, 10);
          expect(actual.minTemperature, 5);
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
