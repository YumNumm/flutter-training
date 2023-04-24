// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'fetch_weather_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FetchWeatherResponse _$$_FetchWeatherResponseFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$_FetchWeatherResponse',
      json,
      ($checkedConvert) {
        final val = _$_FetchWeatherResponse(
          weatherCondition: $checkedConvert('weather_condition',
              (v) => $enumDecode(_$WeatherConditionEnumMap, v)),
          date: $checkedConvert('date', (v) => DateTime.parse(v as String)),
          maxTemperature: $checkedConvert('max_temperature', (v) => v as int),
          minTemperature: $checkedConvert('min_temperature', (v) => v as int),
        );
        return val;
      },
      fieldKeyMap: const {
        'weatherCondition': 'weather_condition',
        'maxTemperature': 'max_temperature',
        'minTemperature': 'min_temperature'
      },
    );

Map<String, dynamic> _$$_FetchWeatherResponseToJson(
        _$_FetchWeatherResponse instance) =>
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
