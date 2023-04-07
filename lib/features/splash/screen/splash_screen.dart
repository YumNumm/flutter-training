import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_training/constants/route.dart';
import 'package:flutter_training/features/splash/mixin/perform_after_layout.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashState();
}

class _SplashState extends State<SplashScreen> with PerformAfterLayoutMinxin {
  /// WeatherScreenに遷移
  /// WeatherScreenからpopされたら、指定時間経過後 再度WeatherScreenに遷移
  Future<void> delayedTransitToWeatherScreenWithLoop() async {
    await Future<void>.delayed(
      const Duration(milliseconds: 500),
    );
    if (mounted) {
      // WeatherScreenに遷移する
      await router.push(const WeatherRoute().location);
      // popしたので再度遷移する
      await delayedTransitToWeatherScreenWithLoop();
    }
  }

  @override
  void afterFirstLayout() => delayedTransitToWeatherScreenWithLoop();

  @override
  Widget build(BuildContext context) {
    return const SizedBox.expand(
      child: ColoredBox(
        color: Colors.green,
      ),
    );
  }
}
