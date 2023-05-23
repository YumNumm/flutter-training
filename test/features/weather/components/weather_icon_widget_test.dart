import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/features/weather/components/weather_icon_widget.dart';
import 'package:flutter_training/features/weather/model/weather_condition.dart';

void main() {
  testWidgets('weatherConditionがnullの場合 Placeholderを表示する', (tester) async {
    await tester.pumpWidget(
      const WeatherIconWidget(weatherCondition: null),
    );
    expect(find.byType(Placeholder), findsOneWidget);
    expect(find.byType(SvgPicture), findsNothing);
  });
}
