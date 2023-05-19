import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/common/model/result.dart';
import 'package:flutter_training/features/weather/components/weather_icon_widget.dart';
import 'package:flutter_training/features/weather/components/weather_temperature_widget.dart';
import 'package:flutter_training/features/weather/model/fetch_weather_response.dart';
import 'package:flutter_training/features/weather/model/weather_condition.dart';
import 'package:flutter_training/features/weather/model/weather_error_type.dart';
import 'package:flutter_training/features/weather/screen/weather_screen.dart';
import 'package:flutter_training/features/weather/use_case/weather_use_case.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../utils/display_size.dart';
import '../viewmodel/weather_viewmodel_test.dart';

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
  setUp(setDisplaySize);
  tearDown(clearDisplaySize);

  late ProviderScope providerScope;

  testWidgets('初期状態で、全てのWidgetが表示されていること', (tester) async {
    await tester.pumpWidget(const _WeatherTestScreen());
    expect(find.byType(WeatherScreen), findsOneWidget);

    expect(find.byType(WeatherTemperatureWidget), findsOneWidget);
    expect(find.byType(Placeholder), findsOneWidget);
    expect(find.byType(TextButton), findsNWidgets(2));
    // _Buttons
    expect(find.text('Close'), findsOneWidget);
    expect(find.text('Reload'), findsOneWidget);
  });

  testWidgets(
    '特定の条件で、晴れの画像が表示されること',
    (tester) async {
      // Arrange
      final mockUseCase = MockWeatherUseCase()
        ..result(
          Result.success(
            FetchWeatherResponse(
              weatherCondition: WeatherCondition.sunny,
              date: DateTime(2000),
              maxTemperature: 30,
              minTemperature: 10,
            ),
          ),
        );
      providerScope = ProviderScope(
        overrides: [
          fetchWeatherUseCaseProvider.overrideWithValue(
            mockUseCase,
          ),
        ],
        child: const _WeatherTestScreen(),
      );
      await tester.pumpWidget(providerScope);
      // Act
      await tester.tap(find.text('Reload'));
      await tester.pumpAndSettle();
      // Assert
      expect(find.byType(WeatherIconWidget), findsOneWidget);
      final weatherIconWidget = tester.widget<WeatherIconWidget>(
        find.byType(WeatherIconWidget),
      );
      expect(weatherIconWidget.weatherCondition, WeatherCondition.sunny);
    },
  );
  testWidgets(
    '特定の条件で、くもりの画像が表示されること',
    (tester) async {
      // Arrange
      final mockUseCase = MockWeatherUseCase()
        ..result(
          Result.success(
            FetchWeatherResponse(
              weatherCondition: WeatherCondition.cloudy,
              date: DateTime(2000),
              maxTemperature: 30,
              minTemperature: 10,
            ),
          ),
        );
      providerScope = ProviderScope(
        overrides: [
          fetchWeatherUseCaseProvider.overrideWithValue(
            mockUseCase,
          ),
        ],
        child: const _WeatherTestScreen(),
      );
      await tester.pumpWidget(providerScope);
      // Act
      await tester.tap(find.text('Reload'));
      await tester.pumpAndSettle();
      // Assert
      expect(find.byType(WeatherIconWidget), findsOneWidget);
      final weatherIconWidget = tester.widget<WeatherIconWidget>(
        find.byType(WeatherIconWidget),
      );
      expect(weatherIconWidget.weatherCondition, WeatherCondition.cloudy);
    },
  );
  testWidgets(
    '特定の条件で、雨の画像が表示されること',
    (tester) async {
      // Arrange
      final mockUseCase = MockWeatherUseCase()
        ..result(
          Result.success(
            FetchWeatherResponse(
              weatherCondition: WeatherCondition.rainy,
              date: DateTime(2000),
              maxTemperature: 30,
              minTemperature: 10,
            ),
          ),
        );
      providerScope = ProviderScope(
        overrides: [
          fetchWeatherUseCaseProvider.overrideWithValue(
            mockUseCase,
          ),
        ],
        child: const _WeatherTestScreen(),
      );
      await tester.pumpWidget(providerScope);
      // Act
      await tester.tap(find.text('Reload'));
      await tester.pumpAndSettle();
      // Assert
      expect(find.byType(WeatherIconWidget), findsOneWidget);
      final weatherIconWidget = tester.widget<WeatherIconWidget>(
        find.byType(WeatherIconWidget),
      );
      expect(weatherIconWidget.weatherCondition, WeatherCondition.rainy);
    },
  );
  testWidgets(
    '初期状態で天気の画像は表示されていない',
    (tester) async {
      // Arrange
      providerScope = const ProviderScope(
        child: _WeatherTestScreen(),
      );
      await tester.pumpWidget(providerScope);
      // Act
      await tester.pumpAndSettle();
      // Assert
      expect(find.byType(WeatherIconWidget), findsOneWidget);
      final weatherIconWidget = tester.widget<WeatherIconWidget>(
        find.byType(WeatherIconWidget),
      );
      expect(weatherIconWidget.weatherCondition, null);
      expect(find.byType(Placeholder), findsOneWidget);
    },
  );

  testWidgets(
    '特定の条件で、最高気温が表示されること',
    (tester) async {
      // Arrange
      final mockUseCase = MockWeatherUseCase()
        ..result(
          Result.success(
            FetchWeatherResponse(
              weatherCondition: WeatherCondition.sunny,
              date: DateTime(2000),
              maxTemperature: 30,
              minTemperature: 10,
            ),
          ),
        );
      providerScope = ProviderScope(
        overrides: [
          fetchWeatherUseCaseProvider.overrideWithValue(
            mockUseCase,
          ),
        ],
        child: const _WeatherTestScreen(),
      );
      await tester.pumpWidget(providerScope);
      // Act
      await tester.tap(find.text('Reload'));
      await tester.pumpAndSettle();
      // Assert
      expect(find.byType(WeatherTemperatureWidget), findsOneWidget);
      final weatherTemperatureWidget = tester.widget<WeatherTemperatureWidget>(
        find.byType(WeatherTemperatureWidget),
      );
      expect(weatherTemperatureWidget.maxTemperature, 30);
      expect(find.text('30°C'), findsOneWidget);
    },
  );
  testWidgets(
    '特定の条件で、最低気温が表示されること',
    (tester) async {
      // Arrange
      final mockUseCase = MockWeatherUseCase()
        ..result(
          Result.success(
            FetchWeatherResponse(
              weatherCondition: WeatherCondition.sunny,
              date: DateTime(2000),
              maxTemperature: 30,
              minTemperature: 10,
            ),
          ),
        );
      providerScope = ProviderScope(
        overrides: [
          fetchWeatherUseCaseProvider.overrideWithValue(
            mockUseCase,
          ),
        ],
        child: const _WeatherTestScreen(),
      );
      await tester.pumpWidget(providerScope);
      // Act
      await tester.tap(find.text('Reload'));
      await tester.pumpAndSettle();
      // Assert
      expect(find.byType(WeatherTemperatureWidget), findsOneWidget);
      final weatherTemperatureWidget = tester.widget<WeatherTemperatureWidget>(
        find.byType(WeatherTemperatureWidget),
      );
      expect(weatherTemperatureWidget.minTemperature, 10);
      expect(find.text('10°C'), findsOneWidget);
    },
  );
  testWidgets(
    '特定の条件で、ダイアログが表示され、特定のメッセージが表示される',
    (tester) async {
      // Arrange
      final mockUseCase = MockWeatherUseCase()
        ..result(
          const Result.failure(
            WeatherErrorType.unknown,
          ),
        );
      providerScope = ProviderScope(
        overrides: [
          fetchWeatherUseCaseProvider.overrideWithValue(
            mockUseCase,
          ),
        ],
        child: const _WeatherTestScreen(),
      );
      await tester.pumpWidget(providerScope);
      // Act
      await tester.tap(find.text('Reload'));
      await tester.pumpAndSettle();
      // Assert
      expect(find.byType(AlertDialog), findsOneWidget);
      expect(find.text('エラーが発生しました'), findsOneWidget);
      expect(find.text(WeatherErrorType.unknown.message), findsOneWidget);
    },
  );
}
