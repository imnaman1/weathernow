import 'package:weather_now/models/temperature_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'daily_data_model.g.dart';

@JsonSerializable()
class DailyWeather {
  int? dt;
  num? sunrise;
  num? sunset;
  num? humidity;
  num? pressure;
  TemperatureModel? temp;

  DailyWeather(this.dt, this.sunrise, this.sunset, this.humidity, this.pressure,
      this.temp);

  factory DailyWeather.fromJson(Map<String, dynamic> json) =>
      _$DailyWeatherFromJson(json);

  Map<String, dynamic> toJson() => _$DailyWeatherToJson(this);
}
