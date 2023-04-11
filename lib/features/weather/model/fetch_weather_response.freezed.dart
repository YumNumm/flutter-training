// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fetch_weather_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FetchWeatherResponse _$FetchWeatherResponseFromJson(Map<String, dynamic> json) {
  return _FetchWeatherResponse.fromJson(json);
}

/// @nodoc
mixin _$FetchWeatherResponse {
  WeatherCondition get weatherCondition => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  int get maxTemperature => throw _privateConstructorUsedError;
  int get minTemperature => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FetchWeatherResponseCopyWith<FetchWeatherResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FetchWeatherResponseCopyWith<$Res> {
  factory $FetchWeatherResponseCopyWith(FetchWeatherResponse value,
          $Res Function(FetchWeatherResponse) then) =
      _$FetchWeatherResponseCopyWithImpl<$Res, FetchWeatherResponse>;
  @useResult
  $Res call(
      {WeatherCondition weatherCondition,
      DateTime date,
      int maxTemperature,
      int minTemperature});
}

/// @nodoc
class _$FetchWeatherResponseCopyWithImpl<$Res,
        $Val extends FetchWeatherResponse>
    implements $FetchWeatherResponseCopyWith<$Res> {
  _$FetchWeatherResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weatherCondition = null,
    Object? date = null,
    Object? maxTemperature = null,
    Object? minTemperature = null,
  }) {
    return _then(_value.copyWith(
      weatherCondition: null == weatherCondition
          ? _value.weatherCondition
          : weatherCondition // ignore: cast_nullable_to_non_nullable
              as WeatherCondition,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      maxTemperature: null == maxTemperature
          ? _value.maxTemperature
          : maxTemperature // ignore: cast_nullable_to_non_nullable
              as int,
      minTemperature: null == minTemperature
          ? _value.minTemperature
          : minTemperature // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FetchWeatherResponseCopyWith<$Res>
    implements $FetchWeatherResponseCopyWith<$Res> {
  factory _$$_FetchWeatherResponseCopyWith(_$_FetchWeatherResponse value,
          $Res Function(_$_FetchWeatherResponse) then) =
      __$$_FetchWeatherResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {WeatherCondition weatherCondition,
      DateTime date,
      int maxTemperature,
      int minTemperature});
}

/// @nodoc
class __$$_FetchWeatherResponseCopyWithImpl<$Res>
    extends _$FetchWeatherResponseCopyWithImpl<$Res, _$_FetchWeatherResponse>
    implements _$$_FetchWeatherResponseCopyWith<$Res> {
  __$$_FetchWeatherResponseCopyWithImpl(_$_FetchWeatherResponse _value,
      $Res Function(_$_FetchWeatherResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weatherCondition = null,
    Object? date = null,
    Object? maxTemperature = null,
    Object? minTemperature = null,
  }) {
    return _then(_$_FetchWeatherResponse(
      weatherCondition: null == weatherCondition
          ? _value.weatherCondition
          : weatherCondition // ignore: cast_nullable_to_non_nullable
              as WeatherCondition,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      maxTemperature: null == maxTemperature
          ? _value.maxTemperature
          : maxTemperature // ignore: cast_nullable_to_non_nullable
              as int,
      minTemperature: null == minTemperature
          ? _value.minTemperature
          : minTemperature // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FetchWeatherResponse implements _FetchWeatherResponse {
  _$_FetchWeatherResponse(
      {required this.weatherCondition,
      required this.date,
      required this.maxTemperature,
      required this.minTemperature});

  factory _$_FetchWeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$$_FetchWeatherResponseFromJson(json);

  @override
  final WeatherCondition weatherCondition;
  @override
  final DateTime date;
  @override
  final int maxTemperature;
  @override
  final int minTemperature;

  @override
  String toString() {
    return 'FetchWeatherResponse(weatherCondition: $weatherCondition, date: $date, maxTemperature: $maxTemperature, minTemperature: $minTemperature)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchWeatherResponse &&
            (identical(other.weatherCondition, weatherCondition) ||
                other.weatherCondition == weatherCondition) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.maxTemperature, maxTemperature) ||
                other.maxTemperature == maxTemperature) &&
            (identical(other.minTemperature, minTemperature) ||
                other.minTemperature == minTemperature));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, weatherCondition, date, maxTemperature, minTemperature);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchWeatherResponseCopyWith<_$_FetchWeatherResponse> get copyWith =>
      __$$_FetchWeatherResponseCopyWithImpl<_$_FetchWeatherResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FetchWeatherResponseToJson(
      this,
    );
  }
}

abstract class _FetchWeatherResponse implements FetchWeatherResponse {
  factory _FetchWeatherResponse(
      {required final WeatherCondition weatherCondition,
      required final DateTime date,
      required final int maxTemperature,
      required final int minTemperature}) = _$_FetchWeatherResponse;

  factory _FetchWeatherResponse.fromJson(Map<String, dynamic> json) =
      _$_FetchWeatherResponse.fromJson;

  @override
  WeatherCondition get weatherCondition;
  @override
  DateTime get date;
  @override
  int get maxTemperature;
  @override
  int get minTemperature;
  @override
  @JsonKey(ignore: true)
  _$$_FetchWeatherResponseCopyWith<_$_FetchWeatherResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
