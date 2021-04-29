import 'package:json_annotation/json_annotation.dart';

part 'temperature_model.g.dart';

@JsonSerializable()
class TemperatureModel {
  num? day;
  num? min;
  num? max;
  num? night;
  num? eve;
  num? morn;

  TemperatureModel(
      this.day, this.min, this.max, this.night, this.eve, this.morn);

  factory TemperatureModel.fromJson(Map<String, dynamic> json) =>
      _$TemperatureModelFromJson(json);

  Map<String, dynamic> toJson() => _$TemperatureModelToJson(this);
}
