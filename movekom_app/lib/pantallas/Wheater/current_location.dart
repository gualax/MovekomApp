import 'package:geolocator/geolocator.dart';


class CurrentLocation {
  static Position _currentPosition;




  static Position getCurrentLocation() {
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
          print(position);
      return position;
    }).catchError((e) {
      print(e);
    });
  }

}

