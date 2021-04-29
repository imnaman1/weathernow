// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyWeather _$DailyWeatherFromJson(Map<String, dynamic> json) {
  return DailyWeather(
    json['dt'] as int?,
    json['sunrise'] as num?,
    json['sunset'] as num?,
    json['humidity'] as num?,
    json['pressure'] as num?,
    json['temp'] == null
        ? null
        : TemperatureModel.fromJson(json['temp'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DailyWeatherToJson(DailyWeather instance) =>
    <String, dynamic>{
      'dt': instance.dt,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
      'humidity': instance.humidity,
      'pressure': instance.pressure,
      'temp': instance.temp,
    };
