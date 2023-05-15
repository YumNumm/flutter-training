import 'package:data_fixture_dart/definitions/fixture_definition.dart';
import 'package:data_fixture_dart/definitions/json_fixture_definition.dart';
import 'package:data_fixture_dart/factories/json_fixture_factory.dart';
import 'package:flutter_training/features/weather/model/fetch_weather_request.dart';

extension FetchWeatherRequestFixture on FetchWeatherRequest {
  // ignore: library_private_types_in_public_api
  static _FetchWeatherRequestFixtureFactory get factory =>
      _FetchWeatherRequestFixtureFactory();
}

class _FetchWeatherRequestFixtureFactory
    extends JsonFixtureFactory<FetchWeatherRequest> {
  @override
  FixtureDefinition<FetchWeatherRequest> definition() => define(
        (faker) {
          return FetchWeatherRequest(
            area: faker.lorem.word(),
            date: faker.date.dateTime(),
          );
        },
      );

  @override
  JsonFixtureDefinition<FetchWeatherRequest> jsonDefinition() => defineJson(
        (request) => <String, dynamic>{
          'area': request.area,
          'date': request.date.toIso8601String(),
        },
      );
}
