import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_training/constants/route.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<SplashScreen> {
  /// WeatherScreenに遷移する
  /// WeatherScreenからpopされたら、指定時間経過後 再度WeatherScreenに遷移する
  Future<void> delayedTransitToWeatherScreenWithLoop() async {
    await Future<void>.delayed(
      const Duration(milliseconds: 500),
    );
    if (context.mounted) {
      // WeatherScreenに遷移する
      await router.push(const WeatherRoute().location);
      // popしたので再度遷移する
      await delayedTransitToWeatherScreenWithLoop();
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Timer(
        const Duration(milliseconds: 500),
        delayedTransitToWeatherScreenWithLoop,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.expand(
      child: ColoredBox(
        color: Colors.green,
      ),
    );
  }
}
