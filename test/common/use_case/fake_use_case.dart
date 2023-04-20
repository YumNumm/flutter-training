import 'package:flutter/material.dart';
import 'package:flutter_training/common/use_case/use_case.dart';

/// UseCaseのテスト用のダミークラス
/// test内で利用する
/// ```dart
/// class FakeSampleUseCase extends FakeUseCase<int, String>
///    implements SampleUseCase {}
///
/// void test() {
///   late final FakeSampleUseCase useCase;
///   setUp(() => useCase = FakeSampleUseCase());
///   test('test', () {
///     // usecCaseが返すものを指定
///     useCase.result('result: 1');
///     //useCase.resultCallback = (param) => 'result: $param';
///     expect(useCase.call(1), 'result: 1');
///   });
/// }
///
/// ```
@visibleForTesting
class FakeUseCase<Param, Result> extends UseCase<Param, Result> {
  late final Result Function(Param)? _callback;

  // ignore: avoid_setters_without_getters
  set resultCallback(Result Function(Param param) callback) {
    _callback = callback;
  }

  void result(Result v) {
    _callback = (_) => v;
  }

  @override
  Result call(Param param) => _callback!(param);
}
