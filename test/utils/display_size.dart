import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// 画面サイズを変更する
/// [displaySize] はデフォルトで iPhone 12 のサイズを指定
void setDisplaySize({Size displaySize = const Size(390, 844)}) {
  final binding = TestWidgetsFlutterBinding.ensureInitialized();
  binding.window.physicalSizeTestValue = displaySize;
  binding.window.devicePixelRatioTestValue = 1.0;
}

/// 画面サイズをデフォルトに戻す
void clearDisplaySize() {
  final binding = TestWidgetsFlutterBinding.ensureInitialized();
  binding.window.clearPhysicalSizeTestValue();
  binding.window.clearDevicePixelRatioTestValue();
}
