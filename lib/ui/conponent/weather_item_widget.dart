import 'package:flutter/material.dart';
import 'package:flutter_training/ui/conponent/weather_view/weather_icon_widget.dart';

class WeatherCategoryWidget extends StatelessWidget {
  const WeatherCategoryWidget({super.key});

  // TODO(YumNumm): 天気・各種気温の表示

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const WeatherIconWidget(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                '**°C',
                style: theme.textTheme.labelLarge?.copyWith(
                  color: Colors.blue,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                '**°C',
                style: theme.textTheme.labelLarge?.copyWith(
                  color: Colors.red,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
