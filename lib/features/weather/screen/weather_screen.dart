import 'package:flutter/material.dart';
import 'package:flutter_training/features/weather/components/weather_temperature_widget.dart';
import 'package:flutter_training/features/weather/model/weather_condition.dart';
import 'package:flutter_training/features/weather/viewmodel/weather_viewmodel.dart';
import 'package:go_router/go_router.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  WeatherCondition? weatherCondition;

  final viewModel = WeatherViewModel(YumemiWeather());

  @override
  Widget build(BuildContext context) {
    final body = Column(
      children: [
        const Spacer(),
        WeatherTemperatureWidget(
          weatherCondition: weatherCondition,
          maxTemperature: null,
          minTemperature: null,
        ),
        Flexible(
          child: Column(
            children: [
              const SizedBox(height: 80),
              _Buttons(
                onReloadTap: () => viewModel.fetchThrowsWeather().when(
                      success: (value) => setState(() {
                        weatherCondition = value;
                      }),
                      failure: (e) => showErrorDialog(
                        context: context,
                        title: 'エラーが発生しました',
                        message: e.toString(),
                      ),
                    ),
                onCloseTap: context.pop,
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

  Future<void> showErrorDialog({
    required BuildContext context,
    required String title,
    required String message,
  }) =>
      showDialog<void>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () => context.pop(),
                child: const Text('Close'),
              ),
            ],
          );
        },
      );
}

class _Buttons extends StatelessWidget {
  const _Buttons({
    required this.onReloadTap,
    required this.onCloseTap,
  });

  final void Function() onReloadTap;
  final void Function() onCloseTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            onPressed: onCloseTap,
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
