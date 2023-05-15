// Mocks generated by Mockito 5.4.0 from annotations
// in flutter_training/test/features/weather/use_case/weather_use_case_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_training/features/weather/data/weather_data_source.dart'
    as _i3;
import 'package:flutter_training/features/weather/model/fetch_weather_request.dart'
    as _i4;
import 'package:flutter_training/features/weather/model/fetch_weather_response.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeFetchWeatherResponse_0 extends _i1.SmartFake
    implements _i2.FetchWeatherResponse {
  _FakeFetchWeatherResponse_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [WeatherDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockWeatherDataSource extends _i1.Mock implements _i3.WeatherDataSource {
  @override
  _i2.FetchWeatherResponse fetchWeather(_i4.FetchWeatherRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchWeather,
          [request],
        ),
        returnValue: _FakeFetchWeatherResponse_0(
          this,
          Invocation.method(
            #fetchWeather,
            [request],
          ),
        ),
        returnValueForMissingStub: _FakeFetchWeatherResponse_0(
          this,
          Invocation.method(
            #fetchWeather,
            [request],
          ),
        ),
      ) as _i2.FetchWeatherResponse);
}
