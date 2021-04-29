// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'temperature_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TemperatureModel _$TemperatureModelFromJson(Map<String, dynamic> json) {
  return TemperatureModel(
    json['day'] as num?,
    json['min'] as num?,
    json['max'] as num?,
    json['night'] as num?,
    json['eve'] as num?,
    json['morn'] as num?,
  );
}

Map<String, dynamic> _$TemperatureModelToJson(TemperatureModel instance) =>
    <String, dynamic>{
      'day': instance.day,
      'min': instance.min,
      'max': instance.max,
      'night': instance.night,
      'eve': instance.eve,
      'morn': instance.morn,
    };
