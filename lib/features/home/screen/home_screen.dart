import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_training/constants/route.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
