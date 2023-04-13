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
String _$weatherViewModelHash() => r'f6d2d28319330bf11754e3027ad1258adf34e59c';

/// See also [WeatherViewModel].
@ProviderFor(WeatherViewModel)
final weatherViewModelProvider = AutoDisposeNotifierProvider<WeatherViewModel,
    WeatherViewModelState>.internal(
  WeatherViewModel.new,
  name: r'weatherViewModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$weatherViewModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$WeatherViewModel = AutoDisposeNotifier<WeatherViewModelState>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
