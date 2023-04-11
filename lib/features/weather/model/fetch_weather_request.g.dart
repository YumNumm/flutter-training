// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_weather_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FetchWeatherRequest _$$_FetchWeatherRequestFromJson(
  Map<String, dynamic> json,
) =>
    _$_FetchWeatherRequest(
      area: json['area'] as String,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$_FetchWeatherRequestToJson(
  _$_FetchWeatherRequest instance,
) =>
    <String, dynamic>{
      'area': instance.area,
      'date': instance.date.toIso8601String(),
    };
