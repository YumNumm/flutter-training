import 'package:data_fixture_dart/definitions/fixture_definition.dart';
import 'package:data_fixture_dart/definitions/json_fixture_definition.dart';
import 'package:data_fixture_dart/factories/json_fixture_factory.dart';
import 'package:flutter_training/features/weather/model/fetch_weather_response.dart';
import 'package:flutter_training/features/weather/model/weather_condition.dart';

extension FetchWeatherResponseFixture on FetchWeatherResponse {
  // ignore: library_private_types_in_public_api
  static _FetchWeatherResponseFixtureFactory get factory =>
      _FetchWeatherResponseFixtureFactory();
}

class _FetchWeatherResponseFixtureFactory
    extends JsonFixtureFactory<FetchWeatherResponse> {
  @override
  FixtureDefinition<FetchWeatherResponse> definition() => define(
        (faker) {
          return FetchWeatherResponse(
            date: faker.date.dateTime(),
            maxTemperature: faker.randomGenerator.integer(min: 20, 50),
            minTemperature: faker.randomGenerator.integer(min: 10, 20),
            weatherCondition:
                faker.randomGenerator.element(WeatherCondition.values),
          );
        },
      );

  @override
  JsonFixtureDefinition<FetchWeatherResponse> jsonDefinition() => defineJson(
        (request) => <String, dynamic>{
          'date': request.date.toIso8601String(),
          'max_temperature': request.maxTemperature,
          'min_temperature': request.minTemperature,
          'weather_condition': request.weatherCondition.name,
        },
      );
}
