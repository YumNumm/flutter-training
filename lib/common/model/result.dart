import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
class Result<T, R> with _$Result<T, R> {
  const factory Result.success(T value) = Success<T, R>;
  const factory Result.failure(R error) = Failure<T, R>;
}
