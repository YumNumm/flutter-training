import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/features/weather/model/fetch_weather_request.dart';

void main() {
  test(
    '正しいJSONファイルからインスタンスが生成される',
    () {
      // Arrange
      const json = <String, dynamic>{
        'area': 'London',
        'date': '2000-01-01',
      };
      // Act
      final actual = FetchWeatherRequest.fromJson(json);
      // Assert
      expect(actual.area, 'London');
      expect(actual.date, DateTime(2000));
    },
  );
}
