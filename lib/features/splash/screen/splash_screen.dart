import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_training/constants/route.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    unawaited(
      () async {
        await Future<void>.delayed(
          const Duration(milliseconds: 500),
        );
        if (context.mounted) {
          const WeatherRoute().push(context);
        }
      }(),
    );
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
