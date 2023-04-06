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
  Widget build(BuildContext context) {
    WidgetsBinding.instance.endOfFrame.then((_) {
      // 500ms後にSplashRouteに遷移する
      Timer(const Duration(milliseconds: 500), () {
        if (context.mounted &&
            router.location != const WeatherRoute().location) {
          const WeatherRoute().push(context);
        }
      });
    });
    return const SizedBox.expand(
      child: ColoredBox(
        color: Colors.green,
      ),
    );
  }
}
