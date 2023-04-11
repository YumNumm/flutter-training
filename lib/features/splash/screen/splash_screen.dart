import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_training/common/provider/router_provider.dart';
import 'package:flutter_training/constants/route.dart';
import 'package:flutter_training/features/splash/mixin/perform_after_layout.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with PerformAfterLayoutMixin {
  /// WeatherScreenに遷移
  /// WeatherScreenからpopされたら、指定時間経過後 再度WeatherScreenに遷移
  Future<void> delayedTransitToWeatherScreenWithLoop() async {
    await Future<void>.delayed(
      const Duration(milliseconds: 500),
    );
    if (mounted) {
      // WeatherScreenに遷移する
      final router = ref.read(routerProvider);
      await router.push(const WeatherRoute().location);
      // popしたので再度遷移する
      await delayedTransitToWeatherScreenWithLoop();
    }
  }

  @override
  void afterLayout() => delayedTransitToWeatherScreenWithLoop();

  @override
  Widget build(BuildContext context) {
    return const SizedBox.expand(
      child: ColoredBox(
        color: Colors.green,
      ),
    );
  }
}
