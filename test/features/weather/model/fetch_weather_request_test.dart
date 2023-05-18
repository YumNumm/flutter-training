import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/features/weather/model/fetch_weather_request.dart';

import 'fetch_weather_request_fixture.dart';

void main() {
  test('fromJson', () {
    final requestWithJsons =
        FetchWeatherRequestFixture.factory.makeManyWithJsonArray(100);

    for (final request in requestWithJsons) {
      final act = FetchWeatherRequest.fromJson(request.json);
      final expected = request.object;
      expect(act, expected);
    }
  });

  test('toJson', () {
    final requestWithJsons =
        FetchWeatherRequestFixture.factory.makeManyWithJsonArray(100);

    for (final request in requestWithJsons) {
      final act = request.object.toJson();
      final expected = request.json;
      expect(act, expected);
    }
  });
}
