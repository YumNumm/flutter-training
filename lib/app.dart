import 'package:flutter/material.dart';
import 'package:flutter_training/features/weather/view/weather_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Yumemi Weather',
      home: WeatherScreen(),
    );
  }
}
