// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'weather_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$yumemiWeatherHash() => r'0a5ea5cd4c0cfadc534f6ab14a350aeaf77bc2fe';

/// See also [yumemiWeather].
@ProviderFor(yumemiWeather)
final yumemiWeatherProvider = Provider<YumemiWeather>.internal(
  yumemiWeather,
  name: r'yumemiWeatherProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$yumemiWeatherHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef YumemiWeatherRef = ProviderRef<YumemiWeather>;
String _$weatherViewModelHash() => r'6c96c3b6ed95ac98dda5c02ca6c1752607944c59';

/// See also [WeatherViewModel].
@ProviderFor(WeatherViewModel)
final weatherViewModelProvider = AutoDisposeNotifierProvider<WeatherViewModel,
    Result<WeatherViewModelState, WeatherErrorType>>.internal(
  WeatherViewModel.new,
  name: r'weatherViewModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$weatherViewModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$WeatherViewModel
    = AutoDisposeNotifier<Result<WeatherViewModelState, WeatherErrorType>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
