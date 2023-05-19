import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/features/weather/components/weather_icon_widget.dart';
import 'package:flutter_training/features/weather/model/weather_condition.dart';

void main() {
  group(
    'WeatherIconWidget',
    () {
      testWidgets('weatherConditionがnullの場合 Placeholderを表示する',
          (widgetTester) async {
        await widgetTester.pumpWidget(
          const WeatherIconWidget(weatherCondition: null),
        );
        expect(find.byType(Placeholder), findsOneWidget);
        expect(find.byType(SvgPicture), findsNothing);
      });
      testWidgets('weatherConditionが指定された場合 正しいSvgPictureを表示する',
          (widgetTester) async {
        for (final weatherCondition in WeatherCondition.values) {
          await widgetTester.pumpWidget(
            WeatherIconWidget(
              weatherCondition: weatherCondition,
            ),
          );
          expect(find.byType(Placeholder), findsNothing);
          expect(find.byType(SvgPicture), findsOneWidget);

          final svgPicture =
              find.byType(SvgPicture).evaluate().first.widget as SvgPicture;
          expect(
            svgPicture.key,
            ValueKey('weather_icon_${weatherCondition.name}'),
          );
        }
      });
    },
  );
}
