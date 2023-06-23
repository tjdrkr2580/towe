import 'package:geolocator/geolocator.dart';

class MyLocation {
  static Future<List<double>?> getCurrentLocation() async {
    List<double> positionList = [];
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return null;
        }
      }
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
      );
      positionList.add(position.latitude);
      positionList.add(position.longitude);
      print(positionList);
      return positionList;
    } catch (e) {
      print('$e');
      return null;
    }
  }
}
