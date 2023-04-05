import 'package:flutter/material.dart';
import 'package:flutter_training/ui/conponent/weather_item_widget.dart';
import 'package:flutter_training/ui/conponent/weather_view/weather_control_widgets.dart';

class WeatherView extends StatefulWidget {
  const WeatherView({super.key});

  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(),
            const FractionallySizedBox(
              widthFactor: 0.5,
              child: WeatherCategoryWidget(),
            ),
            Expanded(
              child: Column(
                children: const [
                  SizedBox(height: 80),
                  FractionallySizedBox(
                    widthFactor: 0.5,
                    child: WeatherControlWidgets(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
