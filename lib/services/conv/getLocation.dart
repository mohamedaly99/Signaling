import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';

Future<LocationData> getLocation() async {
    LocationData currentLocation ;
    try {
      var location = Location();
            currentLocation = await location.getLocation();
    } catch (e) {
      print(e);
      // currentLocation = null;
    }
    return currentLocation;
  }

  Future<double> getDistance(double iLat , double iLong , double cLat,double cLong) async {
    double distanceInMeters = await Geolocator().distanceBetween(iLat, iLong, cLat, cLong);
    return distanceInMeters;
  }