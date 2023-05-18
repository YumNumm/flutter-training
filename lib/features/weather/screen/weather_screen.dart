import 'package:flutter/material.dart';
import 'package:flutter_training/features/weather/components/weather_temperature_widget.dart';
import 'package:flutter_training/features/weather/viewmodel/weather_viewmodel.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WeatherScreen extends HookConsumerWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(weatherViewModelProvider);
    ref.listen(weatherViewModelProvider.select((value) => value.errorOrNull),
        (_, error) async {
      if (error == null) {
        return;
      }
      await showErrorDialog(
        context: context,
        title: 'エラーが発生しました',
        message: error.message,
      );
      // 状態をリセットする
      ref.invalidate(weatherViewModelProvider);
    });

    final body = Column(
      children: [
        const Spacer(),
        state.when(
          success: (data) {
            return WeatherTemperatureWidget(
              weatherCondition: data.weatherCondition,
              maxTemperature: data.maxTemperature,
              minTemperature: data.minTemperature,
            );
          },
          failure: (_) {
            return const WeatherTemperatureWidget(
              weatherCondition: null,
              maxTemperature: null,
              minTemperature: null,
            );
          },
        ),
        Flexible(
          child: Column(
            children: [
              const SizedBox(height: 80),
              _Buttons(
                onReloadTap: () =>
                    ref.read(weatherViewModelProvider.notifier).fetchWeather(
                          area: 'Tokyo',
                          date: DateTime.now(),
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
