import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// 画面サイズを変更する
/// [displaySize] はデフォルトで iPhone 12 のサイズを指定
void setDisplaySize(
  WidgetTester tester, {
  Size displaySize = const Size(390, 844),
}) {
  tester.view.physicalSize = displaySize;
  tester.view.devicePixelRatio = 1.0;
}

/// 画面サイズをデフォルトに戻す
void tearDownDisplaySize(WidgetTester tester) {
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetPhysicalSize);
}
