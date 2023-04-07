import 'package:flutter/material.dart';
import 'package:flutter_training/constants/route.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Yumemi Weather',
      routerConfig: router,
    );
  }
}
