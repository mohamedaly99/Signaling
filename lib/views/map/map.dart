import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  @override
  final double lat;
  final double lang;
  MapSample({this.lat, this.lang});
  State<MapSample> createState() => MapSampleState(lat, lang);
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();
  double lat;
  double lang;
  MapSampleState(this.lat, this.lang);

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        myLocationEnabled: true,
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: LatLng(lat, lang),
          zoom: 16,
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
