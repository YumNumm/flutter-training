// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Result<T, R> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T value) success,
    required TResult Function(R error) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T value)? success,
    TResult? Function(R error)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T value)? success,
    TResult Function(R error)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success<T, R> value) success,
    required TResult Function(Failure<T, R> value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Success<T, R> value)? success,
    TResult? Function(Failure<T, R> value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success<T, R> value)? success,
    TResult Function(Failure<T, R> value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultCopyWith<T, R, $Res> {
  factory $ResultCopyWith(
          Result<T, R> value, $Res Function(Result<T, R>) then) =
      _$ResultCopyWithImpl<T, R, $Res, Result<T, R>>;
}

/// @nodoc
class _$ResultCopyWithImpl<T, R, $Res, $Val extends Result<T, R>>
    implements $ResultCopyWith<T, R, $Res> {
  _$ResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SuccessCopyWith<T, R, $Res> {
  factory _$$SuccessCopyWith(
          _$Success<T, R> value, $Res Function(_$Success<T, R>) then) =
      __$$SuccessCopyWithImpl<T, R, $Res>;
  @useResult
  $Res call({T value});
}

/// @nodoc
class __$$SuccessCopyWithImpl<T, R, $Res>
    extends _$ResultCopyWithImpl<T, R, $Res, _$Success<T, R>>
    implements _$$SuccessCopyWith<T, R, $Res> {
  __$$SuccessCopyWithImpl(
      _$Success<T, R> _value, $Res Function(_$Success<T, R>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_$Success<T, R>(
      freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$Success<T, R> extends Success<T, R> {
  const _$Success(this.value) : super._();

  @override
  final T value;

  @override
  String toString() {
    return 'Result<$T, $R>.success(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Success<T, R> &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessCopyWith<T, R, _$Success<T, R>> get copyWith =>
      __$$SuccessCopyWithImpl<T, R, _$Success<T, R>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T value) success,
    required TResult Function(R error) failure,
  }) {
    return success(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T value)? success,
    TResult? Function(R error)? failure,
  }) {
    return success?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T value)? success,
    TResult Function(R error)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success<T, R> value) success,
    required TResult Function(Failure<T, R> value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Success<T, R> value)? success,
    TResult? Function(Failure<T, R> value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success<T, R> value)? success,
    TResult Function(Failure<T, R> value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Success<T, R> extends Result<T, R> {
  const factory Success(final T value) = _$Success<T, R>;
  const Success._() : super._();

  T get value;
  @JsonKey(ignore: true)
  _$$SuccessCopyWith<T, R, _$Success<T, R>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailureCopyWith<T, R, $Res> {
  factory _$$FailureCopyWith(
          _$Failure<T, R> value, $Res Function(_$Failure<T, R>) then) =
      __$$FailureCopyWithImpl<T, R, $Res>;
  @useResult
  $Res call({R error});
}

/// @nodoc
class __$$FailureCopyWithImpl<T, R, $Res>
    extends _$ResultCopyWithImpl<T, R, $Res, _$Failure<T, R>>
    implements _$$FailureCopyWith<T, R, $Res> {
  __$$FailureCopyWithImpl(
      _$Failure<T, R> _value, $Res Function(_$Failure<T, R>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$Failure<T, R>(
      freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as R,
    ));
  }
}

/// @nodoc

class _$Failure<T, R> extends Failure<T, R> {
  const _$Failure(this.error) : super._();

  @override
  final R error;

  @override
  String toString() {
    return 'Result<$T, $R>.failure(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Failure<T, R> &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FailureCopyWith<T, R, _$Failure<T, R>> get copyWith =>
      __$$FailureCopyWithImpl<T, R, _$Failure<T, R>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T value) success,
    required TResult Function(R error) failure,
  }) {
    return failure(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T value)? success,
    TResult? Function(R error)? failure,
  }) {
    return failure?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T value)? success,
    TResult Function(R error)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success<T, R> value) success,
    required TResult Function(Failure<T, R> value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Success<T, R> value)? success,
    TResult? Function(Failure<T, R> value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success<T, R> value)? success,
    TResult Function(Failure<T, R> value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class Failure<T, R> extends Result<T, R> {
  const factory Failure(final R error) = _$Failure<T, R>;
  const Failure._() : super._();

  R get error;
  @JsonKey(ignore: true)
  _$$FailureCopyWith<T, R, _$Failure<T, R>> get copyWith =>
      throw _privateConstructorUsedError;
}
