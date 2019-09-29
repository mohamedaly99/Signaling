
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:rentina/services/user_location.dart';
import 'package:rentina/views/map/map.dart';

class GetLocationPage extends StatefulWidget {
  @override
  _GetLocationPageState createState() => _GetLocationPageState();
}

class _GetLocationPageState extends State<GetLocationPage> {

  var location = new Location();

  LocationData userLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            userLocation == null
                ? CircularProgressIndicator()
                : Text("Location:" +
                    userLocation.latitude.toString() +
                    " " +
                    userLocation.longitude.toString()),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () {
                  _getLocation().then((value) {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MapSample(lat: value.latitude,lang: value.longitude,)));
                  });
                },
                color: Colors.blue,
                child: Text("Get Location", style: TextStyle(color: Colors.white),),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<LocationData> _getLocation() async {
    LocationData currentLocation ;
    try {
      currentLocation = await location.getLocation();
    } catch (e) {
      print(e);
      // currentLocation = null;
    }
    return currentLocation;
  }
}