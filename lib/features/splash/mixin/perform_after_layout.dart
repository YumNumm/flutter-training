import 'package:flutter/material.dart';
import 'package:flutter_training/features/splash/screen/splash_screen.dart';

/// 初回描画完了後に任意の関数を実行するmixin
/// `afterFirstLayout`をoverrideして実装してください
mixin PerformAfterLayoutMinxin on State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.endOfFrame.then(
      (_) => afterFirstLayout(),
    );
    super.initState();
  }

  void afterFirstLayout() {}
}
