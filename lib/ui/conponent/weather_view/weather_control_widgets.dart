import 'package:flutter/material.dart';

class WeatherControlWidgets extends StatelessWidget {
  const WeatherControlWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextButton(
          onPressed: () {},
          child: const Text('Close'),
        ),
        TextButton(
          onPressed: () {},
          child: const Text('Reload'),
        ),
      ],
    );
  }
}
