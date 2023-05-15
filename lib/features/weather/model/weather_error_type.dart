enum WeatherErrorType {
  invalidParameter('パラメータが不正です'),
  unknown('不明なエラーが発生しました'),
  invalidResponse('レスポンスのフォーマットが不正です');

  const WeatherErrorType(this.message);
  final String message;
}
