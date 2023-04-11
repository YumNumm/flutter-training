import 'package:flutter/material.dart';
import 'package:flutter_training/common/provider/router_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      title: 'Yumemi Weather',
      routerConfig: router,
    );
  }
}
