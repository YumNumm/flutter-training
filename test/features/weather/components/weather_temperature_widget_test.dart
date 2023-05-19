import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/features/weather/components/weather_temperature_widget.dart';
import 'package:flutter_training/features/weather/model/weather_condition.dart';

import '../../../utils/display_size.dart';

class _WeatherTemperatureTestWidget extends StatelessWidget {
  const _WeatherTemperatureTestWidget({
    required this.weatherCondition,
    required this.maxTemperature,
    required this.minTemperature,
  });

  final WeatherCondition? weatherCondition;
  final int? maxTemperature;
  final int? minTemperature;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: WeatherTemperatureWidget(
          weatherCondition: weatherCondition,
          maxTemperature: maxTemperature,
          minTemperature: minTemperature,
        ),
      ),
    );
  }
}

void main() {
  setUp(setDisplaySize);
  tearDown(clearDisplaySize);

  group('WeatherTemperatureWidget', () {
    testWidgets('引数が何も指定されなかった場合 **°Cと表示する', (tester) async {
      await tester.pumpWidget(
        const _WeatherTemperatureTestWidget(
          weatherCondition: null,
          maxTemperature: null,
          minTemperature: null,
        ),
      );
      expect(find.text('**°C'), findsNWidgets(2));
    });
    testWidgets(
      '各TextWidgetの上下には16pxのパディングがある',
      (tester) async {
        await tester.pumpWidget(
          const _WeatherTemperatureTestWidget(
            weatherCondition: null,
            minTemperature: 10,
            maxTemperature: 60,
          ),
        );
        final textWidgets = find.byType(Text);
        expect(textWidgets, findsNWidgets(2));
        final textPaddings = tester.widgetList<Padding>(
          find.ancestor(
            of: textWidgets,
            matching: find.byType(Padding),
          ),
        );
        expect(textPaddings, hasLength(2));
        expect(
          textPaddings.every(
            (padding) =>
                padding.padding == const EdgeInsets.symmetric(vertical: 16),
          ),
          isTrue,
        );
      },
    );
    testWidgets(
      '最低気温のTextStyleは labelLarge で colorは青色',
      (tester) async {
        await tester.pumpWidget(
          const _WeatherTemperatureTestWidget(
            weatherCondition: null,
            minTemperature: 10,
            maxTemperature: null,
          ),
        );

        final minTemperatureText = find.text('10°C');
        expect(minTemperatureText, findsOneWidget);
        final minTemperatureTextWidget =
            minTemperatureText.evaluate().first.widget as Text;
        final context = tester.element(minTemperatureText);
        final textTheme = Theme.of(context).textTheme;
        expect(
          minTemperatureTextWidget.style,
          textTheme.labelLarge!.copyWith(color: Colors.blue),
        );
      },
    );
    testWidgets(
      '最高気温のTextStyleは labelLarge で colorは赤色',
      (tester) async {
        await tester.pumpWidget(
          const _WeatherTemperatureTestWidget(
            weatherCondition: null,
            minTemperature: null,
            maxTemperature: 60,
          ),
        );

        final maxTemperatureText = find.text('60°C');
        expect(maxTemperatureText, findsOneWidget);
        final maxTemperatureTextWidget =
            maxTemperatureText.evaluate().first.widget as Text;
        final context = tester.element(maxTemperatureText);
        final textTheme = Theme.of(context).textTheme;
        expect(
          maxTemperatureTextWidget.style,
          textTheme.labelLarge!.copyWith(color: Colors.red),
        );
      },
    );
  });
}
