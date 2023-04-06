import 'package:collection/collection.dart';

enum WeatherCondition {
  sunny,
  cloudy,
  rainy;

  static WeatherCondition? fromString(String input) {
    return WeatherCondition.values.firstWhereOrNull(
      (e) => e.name == input,
    );
  }
}
