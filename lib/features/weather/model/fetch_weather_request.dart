class FetchWeatherRequest {
  FetchWeatherRequest({
    required this.area,
    required this.date,
  });

  factory FetchWeatherRequest.fromJson(Map<String, dynamic> json) =>
      FetchWeatherRequest(
        area: json['area'] as String,
        date: DateTime.parse(json['date'] as String),
      );

  final String area;
  final DateTime date;

  Map<String, dynamic> toJson() => {
        'area': area,
        'date': date.toIso8601String(),
      };
}
