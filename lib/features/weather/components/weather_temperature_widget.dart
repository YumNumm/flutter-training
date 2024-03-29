import 'package:flutter/material.dart';
import 'package:flutter_training/features/weather/components/weather_icon_widget.dart';
import 'package:flutter_training/features/weather/model/weather_condition.dart';

class WeatherTemperatureWidget extends StatelessWidget {
  const WeatherTemperatureWidget({
    required this.weatherCondition,
    required this.maxTemperature,
    required this.minTemperature,
    super.key,
  });

  final WeatherCondition? weatherCondition;
  final int? maxTemperature;
  final int? minTemperature;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final temperatureTextStyle = theme.textTheme.labelLarge;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        WeatherIconWidget(weatherCondition: weatherCondition),
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Center(
                  child: Text(
                    '${minTemperature ?? '**'}°C',
                    style: temperatureTextStyle?.copyWith(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Center(
                  child: Text(
                    '${maxTemperature ?? '**'}°C',
                    style: temperatureTextStyle?.copyWith(
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
