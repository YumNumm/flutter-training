import 'package:flutter/material.dart';
import 'package:flutter_training/features/splash/screen/splash_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 初回描画完了後に任意の関数を実行するmixin
/// `afterLayout`をoverrideして実装してください
mixin PerformAfterLayoutMixin on ConsumerState<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.endOfFrame.then(
      (_) => afterLayout(),
    );
    super.initState();
  }

  void afterLayout();
}
