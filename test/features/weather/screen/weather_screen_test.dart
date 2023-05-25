import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/common/model/result.dart';
import 'package:flutter_training/common/provider/router_provider.dart';
import 'package:flutter_training/constants/route.dart';
import 'package:flutter_training/features/weather/components/weather_icon_widget.dart';
import 'package:flutter_training/features/weather/components/weather_temperature_widget.dart';
import 'package:flutter_training/features/weather/model/fetch_weather_response.dart';
import 'package:flutter_training/features/weather/model/weather_condition.dart';
import 'package:flutter_training/features/weather/model/weather_error_type.dart';
import 'package:flutter_training/features/weather/model/weather_view_model_state.dart';
import 'package:flutter_training/features/weather/screen/weather_screen.dart';
import 'package:flutter_training/features/weather/use_case/weather_use_case.dart';
import 'package:flutter_training/features/weather/viewmodel/weather_viewmodel.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../utils/display_size.dart';
import '../viewmodel/weather_viewmodel_test.dart';

class _WeatherTestScreen extends ConsumerWidget {
  const _WeatherTestScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: ref.watch(routerProvider),
    );
  }
}

Finder findSvgImage(String assetName) {
  return find.byWidgetPredicate(
    (widget) =>
        widget is SvgPicture &&
        (widget.bytesLoader as SvgAssetLoader) // Here!
                .assetName ==
            assetName,
  );
}

class _FakeWeatherViewModel extends WeatherViewModel {
  _FakeWeatherViewModel(this.initialState);
  final AsyncValue<WeatherViewModelState?> initialState;

  @override
  AsyncValue<WeatherViewModelState?> build() => initialState;
}

void main() {
  setUp(setDisplaySize);
  tearDown(clearDisplaySize);

  late ProviderScope providerScope;

  testWidgets('初期状態で、全てのWidgetが表示されていること', (tester) async {
    providerScope = ProviderScope(
      overrides: [
        // 初期ルートを変更
        routerProvider.overrideWithValue(
          GoRouter(
            routes: $appRoutes,
            initialLocation: const WeatherRoute().location,
          ),
        ),
      ],
      child: const _WeatherTestScreen(),
    );
    await tester.pumpWidget(providerScope);
    await tester.pumpAndSettle();
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
      const weatherCondition = WeatherCondition.sunny;
      providerScope = ProviderScope(
        overrides: [
          weatherViewModelProvider.overrideWith(
            () => _FakeWeatherViewModel(
              const AsyncData(
                WeatherViewModelState(
                  weatherCondition: weatherCondition,
                  maxTemperature: 30,
                  minTemperature: 10,
                ),
              ),
            ),
          ),
          // 初期ルートを変更
          routerProvider.overrideWithValue(
            GoRouter(
              routes: $appRoutes,
              initialLocation: const WeatherRoute().location,
            ),
          ),
        ],
        child: const _WeatherTestScreen(),
      );
      await tester.pumpWidget(providerScope);
      await tester.pumpAndSettle();
      // Assert
      expect(
        findSvgImage(weatherCondition.svgImagePath),
        findsOneWidget,
      );
    },
  );
  testWidgets(
    '特定の条件で、くもりの画像が表示されること',
    (tester) async {
      // Arrange
      const weatherCondition = WeatherCondition.cloudy;
      providerScope = ProviderScope(
        overrides: [
          weatherViewModelProvider.overrideWith(
            () => _FakeWeatherViewModel(
              const AsyncData(
                WeatherViewModelState(
                  weatherCondition: weatherCondition,
                  maxTemperature: 30,
                  minTemperature: 10,
                ),
              ),
            ),
          ),
          // 初期ルートを変更
          routerProvider.overrideWithValue(
            GoRouter(
              routes: $appRoutes,
              initialLocation: const WeatherRoute().location,
            ),
          ),
        ],
        child: const _WeatherTestScreen(),
      );
      await tester.pumpWidget(providerScope);
      await tester.pumpAndSettle();
      // Assert
      expect(
        findSvgImage(weatherCondition.svgImagePath),
        findsOneWidget,
      );
    },
  );
  testWidgets(
    '特定の条件で、雨の画像が表示されること',
    (tester) async {
      // Arrange
      const weatherCondition = WeatherCondition.rainy;
      providerScope = ProviderScope(
        overrides: [
          weatherViewModelProvider.overrideWith(
            () => _FakeWeatherViewModel(
              const AsyncData(
                WeatherViewModelState(
                  weatherCondition: weatherCondition,
                  maxTemperature: 30,
                  minTemperature: 10,
                ),
              ),
            ),
          ),
          // 初期ルートを変更
          routerProvider.overrideWithValue(
            GoRouter(
              routes: $appRoutes,
              initialLocation: const WeatherRoute().location,
            ),
          ),
        ],
        child: const _WeatherTestScreen(),
      );
      await tester.pumpWidget(providerScope);
      await tester.pumpAndSettle();
      // Assert
      expect(
        findSvgImage(weatherCondition.svgImagePath),
        findsOneWidget,
      );
    },
  );
  testWidgets(
    '初期状態で天気の画像は表示されていない',
    (tester) async {
      // Arrange
      providerScope = ProviderScope(
        overrides: [
          // 初期ルートを変更
          routerProvider.overrideWithValue(
            GoRouter(
              routes: $appRoutes,
              initialLocation: const WeatherRoute().location,
            ),
          ),
        ],
        child: const _WeatherTestScreen(),
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
      providerScope = ProviderScope(
        overrides: [
          weatherViewModelProvider.overrideWith(
            () => _FakeWeatherViewModel(
              const AsyncData(
                WeatherViewModelState(
                  weatherCondition: WeatherCondition.cloudy,
                  maxTemperature: 30,
                  minTemperature: 10,
                ),
              ),
            ),
          ),
          // 初期ルートを変更
          routerProvider.overrideWithValue(
            GoRouter(
              routes: $appRoutes,
              initialLocation: const WeatherRoute().location,
            ),
          ),
        ],
        child: const _WeatherTestScreen(),
      );
      await tester.pumpWidget(providerScope);
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
      providerScope = ProviderScope(
        overrides: [
          weatherViewModelProvider.overrideWith(
            () => _FakeWeatherViewModel(
              const AsyncData(
                WeatherViewModelState(
                  weatherCondition: WeatherCondition.cloudy,
                  maxTemperature: 30,
                  minTemperature: 10,
                ),
              ),
            ),
          ),
          // 初期ルートを変更
          routerProvider.overrideWithValue(
            GoRouter(
              routes: $appRoutes,
              initialLocation: const WeatherRoute().location,
            ),
          ),
        ],
        child: const _WeatherTestScreen(),
      );
      await tester.pumpWidget(providerScope);
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
          Future.value(
            const Result<FetchWeatherResponse, WeatherErrorType>.failure(
              WeatherErrorType.unknown,
            ),
          ),
        );
      providerScope = ProviderScope(
        overrides: [
          fetchWeatherUseCaseProvider.overrideWithValue(
            mockUseCase,
          ),
          // 初期ルートを変更
          routerProvider.overrideWithValue(
            GoRouter(
              routes: $appRoutes,
              initialLocation: const WeatherRoute().location,
            ),
          ),
        ],
        child: const _WeatherTestScreen(),
      );
      await tester.pumpWidget(providerScope);
      await tester.pumpAndSettle();
      // Act
      await tester.tap(find.text('Reload'));
      await tester.pumpAndSettle();
      // Assert
      expect(find.byType(AlertDialog), findsOneWidget);
      expect(find.text('エラーが発生しました'), findsOneWidget);
      expect(find.text(WeatherErrorType.unknown.message), findsOneWidget);
    },
  );
  testWidgets(
    '特定の条件で、読み込み中のダイアログが表示される',
    (tester) async {
      // 読み込み中にProgressIndicatorは
      // 状態がAsyncData->AsyncLoadingに遷移したときのみ表示される

      // Arrange
      // このCompleterを使って結果を返す
      final fetchResultCompleter =
          Completer<Result<FetchWeatherResponse, WeatherErrorType>>();
      final mockUseCase = MockWeatherUseCase()
        ..result(
          fetchResultCompleter.future,
        );

      providerScope = ProviderScope(
        overrides: [
          fetchWeatherUseCaseProvider.overrideWithValue(mockUseCase),
          // 初期ルートを変更
          routerProvider.overrideWithValue(
            GoRouter(
              routes: $appRoutes,
              initialLocation: const WeatherRoute().location,
            ),
          ),
        ],
        child: const _WeatherTestScreen(),
      );
      await tester.pumpWidget(providerScope);
      await tester.pumpAndSettle();
      expect(find.byType(CircularProgressIndicator), findsNothing);
      // Act
      // この時点では読み込み中になっていないので読み込みボタンを押下
      await tester.tap(find.text('Reload'));
      // pumpAndSettleだとタイムアウトしてしまうので pumpにする
      await tester.pump(const Duration(milliseconds: 100));
      // Completerで結果を返していないので AsyncLoadingなはず
      expect(
        find.byType(CircularProgressIndicator),
        findsWidgets,
      );
    },
  );
}
