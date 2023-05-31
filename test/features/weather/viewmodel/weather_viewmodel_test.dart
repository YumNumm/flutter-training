import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/common/model/result.dart';
import 'package:flutter_training/features/weather/model/fetch_weather_request.dart';
import 'package:flutter_training/features/weather/model/fetch_weather_response.dart';
import 'package:flutter_training/features/weather/model/weather_condition.dart';
import 'package:flutter_training/features/weather/model/weather_error_type.dart';
import 'package:flutter_training/features/weather/model/weather_exception.dart';
import 'package:flutter_training/features/weather/model/weather_view_model_state.dart';
import 'package:flutter_training/features/weather/use_case/weather_use_case.dart';
import 'package:flutter_training/features/weather/viewmodel/weather_viewmodel.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/use_case/fake_use_case.dart';

class MockWeatherUseCase extends FakeUseCase<FetchWeatherRequest,
        Future<Result<FetchWeatherResponse, WeatherErrorType>>>
    implements FetchWeatherUseCase {}

class _FakeWeatherViewModel extends WeatherViewModel {
  _FakeWeatherViewModel(this.initialState);
  final AsyncValue<WeatherViewModelState?> initialState;

  @override
  AsyncValue<WeatherViewModelState?> build() => initialState;
}

void main() {
  test('viewModelでfetchWeatherを呼び出すと 状態が更新されている', () async {
    /// 呼び出し前の状態を作成する

    const initialWeatherState = WeatherViewModelState(
      weatherCondition: WeatherCondition.cloudy,
      maxTemperature: 20,
      minTemperature: 10,
    );

    final fakeViewModel = _FakeWeatherViewModel(
      const AsyncData(initialWeatherState),
    );
    // このCompleterを使って結果を返す
    final fetchResultCompleter =
        Completer<Result<FetchWeatherResponse, WeatherErrorType>>();
    final mockUseCase = MockWeatherUseCase()
      ..result(
        fetchResultCompleter.future,
      );

    final container = ProviderContainer(
      overrides: [
        fetchWeatherUseCaseProvider.overrideWithValue(
          mockUseCase,
        ),
        weatherViewModelProvider.overrideWith(
          () => fakeViewModel,
        ),
      ],
    );
    final fetchCall =
        container.read(weatherViewModelProvider.notifier).fetchWeather(
              area: 'London',
              date: DateTime(2000),
            );
    fetchResultCompleter.complete(
      Result<FetchWeatherResponse, WeatherErrorType>.success(
        FetchWeatherResponse(
          weatherCondition: WeatherCondition.sunny,
          date: DateTime(2000),
          maxTemperature: 100,
          minTemperature: 40,
        ),
      ),
    );

    const afterWeatherState = WeatherViewModelState(
      weatherCondition: WeatherCondition.sunny,
      maxTemperature: 100,
      minTemperature: 40,
    );
    await fetchCall;

    final state = container.read(weatherViewModelProvider);
    expect(state.isLoading, false);
    expect(state.value, afterWeatherState);
  });
  test(
    'APIから返答を待っている間は 前回の状態を維持しながら AsyncLoadingになっている',
    () async {
      /// 呼び出し前の状態を作成する
      const initialState = AsyncValue.data(
        WeatherViewModelState(
          weatherCondition: WeatherCondition.sunny,
          maxTemperature: 20,
          minTemperature: 10,
        ),
      );
      final fakeViewModel = _FakeWeatherViewModel(
        initialState,
      );
      // このCompleterを使って結果を返す
      final fetchResultCompleter =
          Completer<Result<FetchWeatherResponse, WeatherErrorType>>();
      final mockUseCase = MockWeatherUseCase()
        ..result(
          fetchResultCompleter.future,
        );

      final container = ProviderContainer(
        overrides: [
          fetchWeatherUseCaseProvider.overrideWithValue(
            mockUseCase,
          ),
          weatherViewModelProvider.overrideWith(
            () => fakeViewModel,
          ),
        ],
      );
      unawaited(
        container.read(weatherViewModelProvider.notifier).fetchWeather(
              area: 'London',
              date: DateTime(2000),
            ),
      );
      final state = container.read(weatherViewModelProvider);
      expect(state.isLoading, true);
      expect(state.value, initialState.value);
    },
  );
  test(
    'APIの呼び出しで例外が発生した場合 前回の状態を維持しながら AsyncErrorになっている',
    () async {
      /// 呼び出し前の状態を作成する
      const initialState = AsyncValue.data(
        WeatherViewModelState(
          weatherCondition: WeatherCondition.sunny,
          maxTemperature: 20,
          minTemperature: 10,
        ),
      );
      final fakeViewModel = _FakeWeatherViewModel(
        initialState,
      );
      // このCompleterを使って結果を返す
      final fetchResultCompleter =
          Completer<Result<FetchWeatherResponse, WeatherErrorType>>();
      final mockUseCase = MockWeatherUseCase()
        ..result(
          fetchResultCompleter.future,
        );

      final container = ProviderContainer(
        overrides: [
          fetchWeatherUseCaseProvider.overrideWithValue(
            mockUseCase,
          ),
          weatherViewModelProvider.overrideWith(
            () => fakeViewModel,
          ),
        ],
      );
      final fetchCall =
          container.read(weatherViewModelProvider.notifier).fetchWeather(
                area: 'London',
                date: DateTime(2000),
              );
      // 結果を返す
      fetchResultCompleter.complete(
        const Result<FetchWeatherResponse, WeatherErrorType>.failure(
          WeatherErrorType.unknown,
        ),
      );
      await fetchCall;
      // 結果が返ってきた後の状態
      final afterResult = container.read(weatherViewModelProvider);
      // * 読み込み中ではなくなっている
      expect(
        afterResult.isLoading,
        false,
      );
      // * 前回の状態を維持している
      expect(
        afterResult.value,
        initialState.value,
      );
      // * エラーが発生している
      expect(
        afterResult.hasError,
        true,
      );
      // * エラーの内容はAPIから返ってきたものと同じ
      expect(
        afterResult.error! as WeatherExcepiton,
        const TypeMatcher<WeatherExcepiton>().having(
          (e) => e.type,
          'type',
          WeatherErrorType.unknown,
        ),
      );
    },
  );
}
