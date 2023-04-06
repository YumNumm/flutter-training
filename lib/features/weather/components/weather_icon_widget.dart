import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_training/features/weather/model/weather_condition.dart';

class WeatherIconWidget extends StatelessWidget {
  const WeatherIconWidget({required this.weather, super.key});

  final WeatherCondition? weather;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: weather != null
          ? SvgPicture.asset(weather!.svgImagePath)
          : const Placeholder(),
    );
  }
}
