import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:rentina/model/locationmodel.dart';
import 'package:rentina/views/signin/widgets/carItem.dart';
import 'package:scoped_model/scoped_model.dart';

class GetLocationPage extends StatefulWidget {
  @override
  _GetLocationPageState createState() => _GetLocationPageState();
}

class _GetLocationPageState extends State<GetLocationPage> {
  var location = new Location();

  LocationData userLocation;
  @override
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<LocationModel>(
      builder: (context, child, model) {
        
        return Scaffold(
          body: Container(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: model.carList.length,
              itemBuilder: (context, index) {
                return CarItem(
                    model.carList[index]["distance"].toString(),
                    model.carList[index]["fuelLevel"].toString(),
                    model.carList[index]["imagePath"].toString(),
                    model.carList[index]["modelName"].toString(),
                    model.carList[index]["productionYear"].toString(),
                    model.carList[index]["longtiude"].toString(),
                    model.carList[index]["latitude"].toString());
              },
            ),
          ),
        );
      },
    );
  }

  Future<LocationData> _getLocation() async {
    LocationData currentLocation;
    try {
      currentLocation = await location.getLocation();
    } catch (e) {
      print(e);
      // currentLocation = null;
    }
    return currentLocation;
  }
}
