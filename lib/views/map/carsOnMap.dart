import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CarsOnMap extends StatefulWidget {
  final double carLat;
  final double carLang;
  final String carName;
  CarsOnMap({this.carLat, this.carLang, this.carName});
  @override
  State<CarsOnMap> createState() => CarsOnMapState(carLat, carLang, carName);
}

class CarsOnMapState extends State<CarsOnMap> {
  Completer<GoogleMapController> _controller = Completer();
  double carLat;
  double carLang;
  String carName;
  CarsOnMapState(this.carLat, this.carLang, this.carName);

  // static final CameraPosition _kGooglePlex = CameraPosition(
  //   target: LatLng(carlat,-122.085749655962),
  //   zoom: 16,
  // );

  @override
  Widget build(BuildContext context) {
    print(carLang);
    Marker carsMarker = Marker(
      markerId: MarkerId("cars"),
      position: LatLng(carLat, carLang),
      infoWindow: InfoWindow(title: carName),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta),
    );

    return new Scaffold(
      body: GoogleMap(
        myLocationEnabled: true,
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: LatLng(carLat, carLang),
          zoom: 16,
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: {carsMarker},
      ),
    );
  }

  // Marker carsMarker = Marker(
  //   markerId: MarkerId("cars"),
  //   position: LatLng(carLat, carLang),
  //   infoWindow: InfoWindow(title: "avalable cars"),
  //   icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta),
  // );
}
