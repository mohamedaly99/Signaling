import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: RaisedButton(
        color: Colors.blue,
        onPressed: () {
          // var currentLocation = LocationData;
          // var location = Location();
          // print(location.getLocation());
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => MapSample()));
        },
        child: Text("Show my location"),
      ),
    ));
  }
}
