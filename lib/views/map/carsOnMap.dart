import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CarsOnMap extends StatefulWidget {
  final double carLat;
  final double carLang;
  CarsOnMap({this.carLat, this.carLang});
  @override
  State<CarsOnMap> createState() => CarsOnMapState(carLat, carLang);
}

class CarsOnMapState extends State<CarsOnMap> {
  Completer<GoogleMapController> _controller = Completer();
  static double carLat;
  static double carLang;
  CarsOnMapState(carLat, carLang);

  // static final CameraPosition _kGooglePlex = CameraPosition(
  //   target: LatLng(carlat,-122.085749655962),
  //   zoom: 16,
  // );

  @override
  Widget build(BuildContext context) {
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

  Marker carsMarker = Marker(
    markerId: MarkerId("cars"),
    position: LatLng(carLat, carLang),
    infoWindow: InfoWindow(title: "avalable cars"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta),
  );
}
