// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';



import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';






class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(29.9871478, 31.4390194),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text('My location'),
        icon: Icon(Icons.directions_boat),
      ),
    );
  }


Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}

















// class MapsDemo extends StatefulWidget {
//   @override
//   State createState() => MapsDemoState();
// }

// class MapsDemoState extends State<MapsDemo> {

//   GoogleMapController mapController;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.all(15.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: <Widget>[
//           Center(
//             child: SizedBox(
//               width: 300.0,
//               height: 200.0,
//               child: GoogleMap(

//                 onMapCreated: _onMapCreated,
//               ),
//             ),
//           ),
          
//         ],
//       ),
//     );
//   }

//   void _onMapCreated(GoogleMapController controller) {
//     setState(() { mapController = controller; });
//   }
// }