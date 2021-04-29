import 'package:geolocator/geolocator.dart';

class GetCurrentLocation {
  double? latitude;
  double? longitude;
  Future<Position> getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    latitude = position.latitude;
    longitude = position.longitude;
    return position;
  }
}
