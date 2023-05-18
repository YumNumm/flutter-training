import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/common/model/result.dart';
import 'package:flutter_training/features/weather/model/fetch_weather_request.dart';
import 'package:flutter_training/features/weather/model/fetch_weather_response.dart';
import 'package:flutter_training/features/weather/model/weather_condition.dart';
import 'package:flutter_training/features/weather/model/weather_error_type.dart';
import 'package:flutter_training/features/weather/model/weather_view_model_state.dart';
import 'package:flutter_training/features/weather/use_case/weather_use_case.dart';
import 'package:flutter_training/features/weather/viewmodel/weather_viewmodel.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/use_case/fake_use_case.dart';

class MockWeatherUseCase extends FakeUseCase<FetchWeatherRequest,
        Result<FetchWeatherResponse, WeatherErrorType>>
    implements FetchWeatherUseCase {}

void main() {
  test('viewModelでfetchWeatherを呼び出すと 状態が更新されている', () {
    // Arrange
    final mockUseCase = MockWeatherUseCase()
      ..result(
        Result<FetchWeatherResponse, WeatherErrorType>.success(
          FetchWeatherResponse(
            weatherCondition: WeatherCondition.sunny,
            date: DateTime(2000),
            maxTemperature: 20,
            minTemperature: 10,
          ),
        ),
      );
    final container = ProviderContainer(
      overrides: [
        fetchWeatherUseCaseProvider.overrideWithValue(
          mockUseCase,
        ),
      ],
    );
    addTearDown(container.dispose);

    // Act
    Result<WeatherViewModelState, WeatherErrorType> act() {
      container.read(weatherViewModelProvider.notifier).fetchWeather(
            area: 'London',
            date: DateTime(2000),
          );
      return container.read(weatherViewModelProvider);
    }

    const expectedStateResult =
        Result<WeatherViewModelState, WeatherErrorType>.success(
      WeatherViewModelState(
        weatherCondition: WeatherCondition.sunny,
        maxTemperature: 20,
        minTemperature: 10,
      ),
    );

    // Assert
    expect(
      act(),
      expectedStateResult,
    );
  });

  test(
    'viewModelでfetchWeatherを呼び出し 例外が発生した場合 状態が更新されている',
    () {
      // Arrange
      final mockUseCase = MockWeatherUseCase()
        ..result(
          const Result<FetchWeatherResponse, WeatherErrorType>.failure(
            WeatherErrorType.unknown,
          ),
        );
      final container = ProviderContainer(
        overrides: [
          fetchWeatherUseCaseProvider.overrideWithValue(
            mockUseCase,
          ),
        ],
      );
      addTearDown(container.dispose);

      // Act
      Result<WeatherViewModelState, WeatherErrorType> act() {
        container.read(weatherViewModelProvider.notifier).fetchWeather(
              area: 'London',
              date: DateTime(2000),
            );
        return container.read(weatherViewModelProvider);
      }

      const expectedStateResult =
          Result<WeatherViewModelState, WeatherErrorType>.failure(
        WeatherErrorType.unknown,
      );

      // Assert
      expect(
        act(),
        expectedStateResult,
      );
    },
  );
}
