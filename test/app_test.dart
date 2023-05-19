import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/app.dart';
import 'package:flutter_training/features/splash/screen/splash_screen.dart';
import 'package:flutter_training/features/weather/screen/weather_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'utils/display_size.dart';

void main() {
  setUp(setDisplaySize);
  tearDown(clearDisplaySize);

  testWidgets('SplashScreenからWeatherScreenに遷移すること', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: App(),
      ),
    );
    expect(find.byType(SplashScreen), findsOneWidget);
    // 500ms待つ
    await tester.pump(const Duration(milliseconds: 500));
    await tester.pumpAndSettle();
    expect(find.byType(SplashScreen), findsNothing);
    expect(find.byType(WeatherScreen), findsOneWidget);
  });
}
