import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_training/features/weather/components/weather_temperature_widget.dart';
import 'package:flutter_training/features/weather/model/weather_exception.dart';
import 'package:flutter_training/features/weather/viewmodel/weather_viewmodel.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WeatherScreen extends HookConsumerWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(weatherViewModelProvider);
    ref.listen(weatherViewModelProvider, (previous, next) {
      log(next.toString());
      // Call開始時にローディングを表示
      if (next.isLoading) {
        showLoadingOverlay(context: context);
        return;
      }
      if (previous == null) {
        return;
      }

      // Call終了時にローディングを閉じる
      if (previous.isLoading && !next.isLoading) {
        Navigator.of(context).pop();
        if (next.error != null) {
          if (next.error is WeatherExcepiton) {
            final errorType = (next.error! as WeatherExcepiton).type;
            showErrorDialog(
              context: context,
              title: 'エラーが発生しました',
              message: errorType.message,
            );
            return;
          }
          showErrorDialog(
            context: context,
            title: 'エラーが発生しました',
            message: '不明なエラーが発生しました。\n'
                '${next.error}',
          );
          return;
        }
      }
    });

    final body = Column(
      children: [
        const Spacer(),
        WeatherTemperatureWidget(
          weatherCondition: state.value?.weatherCondition,
          maxTemperature: state.value?.maxTemperature,
          minTemperature: state.value?.minTemperature,
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

  Future<void> showLoadingOverlay({
    required BuildContext context,
  }) async {
    await showDialog<void>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
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
