enum WeatherCondition {
  sunny,
  cloudy,
  rainy;

  static WeatherCondition? fromString(String input) {
    switch (input) {
      case 'sunny':
        return WeatherCondition.sunny;
      case 'cloudy':
        return WeatherCondition.cloudy;
      case 'rainy':
        return WeatherCondition.rainy;
      default:
        return null;
      // throw Exception('Unknown weather condition: $input');
    }
  }

  String get svgImagePath => 'assets/images/$name.svg';
}
