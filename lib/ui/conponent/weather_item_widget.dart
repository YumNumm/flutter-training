import 'package:flutter/material.dart';
import 'package:flutter_training/ui/conponent/weather_view/weather_icon_widget.dart';

class WeatherCategoryWidget extends StatelessWidget {
  const WeatherCategoryWidget({super.key});

  // TODO(YumNumm): 天気・各種気温の表示

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final temperatureTextStyle = theme.textTheme.labelLarge;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const WeatherIconWidget(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Center(
                  child: Text(
                    '**°C',
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
                    '**°C',
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
