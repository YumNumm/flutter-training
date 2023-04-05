import 'package:flutter/material.dart';
import 'package:flutter_training/features/weather/components/weather_temperature_widget.dart';

class WeatherView extends StatelessWidget {
  const WeatherView({super.key});

  @override
  Widget build(BuildContext context) {
    final body = Column(
      children: [
        const Spacer(),
        const WeatherTemperatureWidget(),
        Flexible(
          child: Column(
            children: const [
              SizedBox(height: 80),
              _Buttons(),
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
  const _Buttons();

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
            onPressed: () {},
            child: const Text('Reload'),
          ),
        ),
      ],
    );
  }
}
