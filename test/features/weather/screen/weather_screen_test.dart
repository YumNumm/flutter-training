import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/features/weather/components/weather_temperature_widget.dart';
import 'package:flutter_training/features/weather/screen/weather_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../utils/display_size.dart';

class _WeatherTestScreen extends StatelessWidget {
  const _WeatherTestScreen();

  @override
  Widget build(BuildContext context) {
    return const ProviderScope(
      child: MaterialApp(
        home: WeatherScreen(),
      ),
    );
  }
}

void main() {
  testWidgets('初期状態で、全てのWidgetが表示されていること', (tester) async {
    setDisplaySize(tester);
    tearDownDisplaySize(tester);
    await tester.pumpWidget(const _WeatherTestScreen());
    expect(find.byType(WeatherScreen), findsOneWidget);

    expect(find.byType(WeatherTemperatureWidget), findsOneWidget);
    expect(find.byType(Placeholder), findsOneWidget);
    expect(find.byType(TextButton), findsNWidgets(2));
    // _Buttons
    expect(find.text('Close'), findsOneWidget);
    expect(find.text('Reload'), findsOneWidget);
  });
}
