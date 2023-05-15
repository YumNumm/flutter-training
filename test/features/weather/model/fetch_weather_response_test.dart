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
    },
  );
}
