import 'package:flutter/material.dart';
import 'package:flutter_training/features/weather/components/weather_temperature_widget.dart';
import 'package:flutter_training/features/weather/model/weather_condition.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  WeatherCondition? weather;

  final yumemiWeather = YumemiWeather();

  @override
  Widget build(BuildContext context) {
    final body = Column(
      children: [
        const Spacer(),
        WeatherTemperatureWidget(
          weather: weather,
        ),
        Flexible(
          child: Column(
            children: [
              const SizedBox(height: 80),
              _Buttons(
                onReloadTap: () {
                  final res = yumemiWeather.fetchSimpleWeather();
                  setState(() {
                    weather = WeatherCondition.fromString(res);
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: FractionallySizedBox(
            widthFactor: 0.5,
            child: body,
          ),
        ),
      ),
    );
  }
}

class _Buttons extends StatelessWidget {
  const _Buttons({
    required this.onReloadTap,
  });

  final void Function() onReloadTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            onPressed: () {},
            child: const Text('Close'),
          ),
        ),
        Expanded(
          child: TextButton(
            onPressed: onReloadTap,
            child: const Text('Reload'),
          ),
        ),
      ],
    );
  }
}
