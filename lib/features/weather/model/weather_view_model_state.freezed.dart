// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_view_model_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WeatherScreenState {
  WeatherCondition? get weatherCondition => throw _privateConstructorUsedError;
  int? get maxTemperature => throw _privateConstructorUsedError;
  int? get minTemperature => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WeatherScreenStateCopyWith<WeatherScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherScreenStateCopyWith<$Res> {
  factory $WeatherScreenStateCopyWith(
          WeatherScreenState value, $Res Function(WeatherScreenState) then) =
      _$WeatherScreenStateCopyWithImpl<$Res, WeatherScreenState>;
  @useResult
  $Res call(
      {WeatherCondition? weatherCondition,
      int? maxTemperature,
      int? minTemperature});
}

/// @nodoc
class _$WeatherScreenStateCopyWithImpl<$Res, $Val extends WeatherScreenState>
    implements $WeatherScreenStateCopyWith<$Res> {
  _$WeatherScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weatherCondition = freezed,
    Object? maxTemperature = freezed,
    Object? minTemperature = freezed,
  }) {
    return _then(_value.copyWith(
      weatherCondition: freezed == weatherCondition
          ? _value.weatherCondition
          : weatherCondition // ignore: cast_nullable_to_non_nullable
              as WeatherCondition?,
      maxTemperature: freezed == maxTemperature
          ? _value.maxTemperature
          : maxTemperature // ignore: cast_nullable_to_non_nullable
              as int?,
      minTemperature: freezed == minTemperature
          ? _value.minTemperature
          : minTemperature // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WeatherScreenStateCopyWith<$Res>
    implements $WeatherScreenStateCopyWith<$Res> {
  factory _$$_WeatherScreenStateCopyWith(_$_WeatherScreenState value,
          $Res Function(_$_WeatherScreenState) then) =
      __$$_WeatherScreenStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {WeatherCondition? weatherCondition,
      int? maxTemperature,
      int? minTemperature});
}

/// @nodoc
class __$$_WeatherScreenStateCopyWithImpl<$Res>
    extends _$WeatherScreenStateCopyWithImpl<$Res, _$_WeatherScreenState>
    implements _$$_WeatherScreenStateCopyWith<$Res> {
  __$$_WeatherScreenStateCopyWithImpl(
      _$_WeatherScreenState _value, $Res Function(_$_WeatherScreenState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weatherCondition = freezed,
    Object? maxTemperature = freezed,
    Object? minTemperature = freezed,
  }) {
    return _then(_$_WeatherScreenState(
      weatherCondition: freezed == weatherCondition
          ? _value.weatherCondition
          : weatherCondition // ignore: cast_nullable_to_non_nullable
              as WeatherCondition?,
      maxTemperature: freezed == maxTemperature
          ? _value.maxTemperature
          : maxTemperature // ignore: cast_nullable_to_non_nullable
              as int?,
      minTemperature: freezed == minTemperature
          ? _value.minTemperature
          : minTemperature // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_WeatherScreenState implements _WeatherScreenState {
  const _$_WeatherScreenState(
      {required this.weatherCondition,
      required this.maxTemperature,
      required this.minTemperature});

  @override
  final WeatherCondition? weatherCondition;
  @override
  final int? maxTemperature;
  @override
  final int? minTemperature;

  @override
  String toString() {
    return 'WeatherScreenState(weatherCondition: $weatherCondition, maxTemperature: $maxTemperature, minTemperature: $minTemperature)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WeatherScreenState &&
            (identical(other.weatherCondition, weatherCondition) ||
                other.weatherCondition == weatherCondition) &&
            (identical(other.maxTemperature, maxTemperature) ||
                other.maxTemperature == maxTemperature) &&
            (identical(other.minTemperature, minTemperature) ||
                other.minTemperature == minTemperature));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, weatherCondition, maxTemperature, minTemperature);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WeatherScreenStateCopyWith<_$_WeatherScreenState> get copyWith =>
      __$$_WeatherScreenStateCopyWithImpl<_$_WeatherScreenState>(
          this, _$identity);
}

abstract class _WeatherScreenState implements WeatherScreenState {
  const factory _WeatherScreenState(
      {required final WeatherCondition? weatherCondition,
      required final int? maxTemperature,
      required final int? minTemperature}) = _$_WeatherScreenState;

  @override
  WeatherCondition? get weatherCondition;
  @override
  int? get maxTemperature;
  @override
  int? get minTemperature;
  @override
  @JsonKey(ignore: true)
  _$$_WeatherScreenStateCopyWith<_$_WeatherScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}
