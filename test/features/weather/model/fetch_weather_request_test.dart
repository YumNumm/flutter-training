import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/features/weather/model/fetch_weather_request.dart';

import 'fetch_weather_request_fixture.dart';

void main() {
  test('fromJson', () {
    final requestWithJsons =
        FetchWeatherRequestFixture.factory.makeManyWithJsonArray(100);

    for (final request in requestWithJsons) {
      final actual = FetchWeatherRequest.fromJson(request.json);
      final expected = request.object;
      expect(actual, expected);
    }
  });

  test('toJson', () {
    final requestWithJsons =
        FetchWeatherRequestFixture.factory.makeManyWithJsonArray(100);

    for (final request in requestWithJsons) {
      final actual = request.object.toJson();
      final expected = request.json;
      expect(actual, expected);
    }
  });
}
