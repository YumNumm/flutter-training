import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/features/weather/model/fetch_weather_request.dart';

void main() {
  test(
    '正しいJSONファイルからインスタンスが生成される',
    () {
      // Arrange
      const json = <String, dynamic>{
        'area': '東京',
        'date': '2021-01-01',
      };
      // Act
      final actual = FetchWeatherRequest.fromJson(json);
      // Assert
      expect(actual.area, '東京');
      expect(actual.date, DateTime(2021));
    },
  );
}
