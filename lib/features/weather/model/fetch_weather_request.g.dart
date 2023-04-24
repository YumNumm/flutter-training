// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'fetch_weather_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FetchWeatherRequest _$$_FetchWeatherRequestFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$_FetchWeatherRequest',
      json,
      ($checkedConvert) {
        final val = _$_FetchWeatherRequest(
          area: $checkedConvert('area', (v) => v as String),
          date: $checkedConvert('date', (v) => DateTime.parse(v as String)),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_FetchWeatherRequestToJson(
        _$_FetchWeatherRequest instance) =>
    <String, dynamic>{
      'area': instance.area,
      'date': instance.date.toIso8601String(),
    };
