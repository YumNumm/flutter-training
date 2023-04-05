import 'package:flutter/material.dart';
import 'package:flutter_training/ui/view/weather_view/weather_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Yumemi Weather',
      home: WeatherView(),
    );
  }
}
