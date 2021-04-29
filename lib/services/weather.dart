import 'api_request.dart';
import 'constant.dart';
import 'geolocation.dart';

String openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class Weather {
  Future<dynamic> getLocationWeather() async {
    GetCurrentLocation location = GetCurrentLocation();
    await location.getLocation();

    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apikey&units=metric');

    var weatherData = await networkHelper.getData();

    return weatherData;
  }
}
