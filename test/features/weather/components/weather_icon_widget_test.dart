import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/features/weather/components/weather_icon_widget.dart';
import 'package:flutter_training/features/weather/model/weather_condition.dart';

void main() {
  group(
    'WeatherIconWidget',
    () {
      testWidgets('weatherConditionがnullの場合 Placeholderを表示する', (tester) async {
        await tester.pumpWidget(
          const WeatherIconWidget(weatherCondition: null),
        );
        expect(find.byType(Placeholder), findsOneWidget);
        expect(find.byType(SvgPicture), findsNothing);
      });
      testWidgets('weatherConditionが指定された場合 正しいSvgPictureを表示する',
          (tester) async {
        for (final weatherCondition in WeatherCondition.values) {
          await tester.pumpWidget(
            WeatherIconWidget(
              weatherCondition: weatherCondition,
            ),
          );
          expect(find.byType(Placeholder), findsNothing);
          expect(find.byType(SvgPicture), findsOneWidget);

          // Assert
          expect(find.byType(WeatherIconWidget), findsOneWidget);
          final weatherIconWidget = tester.widget<WeatherIconWidget>(
            find.byType(WeatherIconWidget),
          );
          expect(weatherIconWidget.weatherCondition, weatherCondition);
        }
      });
    },
  );
}
