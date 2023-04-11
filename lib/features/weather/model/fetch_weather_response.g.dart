// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_weather_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FetchWeatherResponse _$$_FetchWeatherResponseFromJson(
  Map<String, dynamic> json,
) =>
    _$_FetchWeatherResponse(
      weatherCondition:
          $enumDecode(_$WeatherConditionEnumMap, json['weather_condition']),
      date: DateTime.parse(json['date'] as String),
      maxTemperature: json['max_temperature'] as int,
      minTemperature: json['min_temperature'] as int,
    );

Map<String, dynamic> _$$_FetchWeatherResponseToJson(
  _$_FetchWeatherResponse instance,
) =>
    <String, dynamic>{
      'weather_condition':
          _$WeatherConditionEnumMap[instance.weatherCondition]!,
      'date': instance.date.toIso8601String(),
      'max_temperature': instance.maxTemperature,
      'min_temperature': instance.minTemperature,
    };

const _$WeatherConditionEnumMap = {
  WeatherCondition.sunny: 'sunny',
  WeatherCondition.cloudy: 'cloudy',
  WeatherCondition.rainy: 'rainy',
};
