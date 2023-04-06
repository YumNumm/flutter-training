import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_training/features/weather/model/weather_condition.dart';

class WeatherIconWidget extends StatelessWidget {
  const WeatherIconWidget({required this.weatherCondition, super.key});

  final WeatherCondition? weatherCondition;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: weatherCondition != null
          ? SvgPicture.asset(weatherCondition!.svgImagePath)
          : const Placeholder(),
    );
  }
}
