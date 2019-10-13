import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rentina/views/map/carsOnMap.dart';
import 'package:rentina/views/map/map.dart';

class CarItem extends StatelessWidget {
  final String modelName;
  final String productionYear;
  final String image;
  final String distance;
  final String fuelLevel;
  final String longtiude;
  final String latitude;

  CarItem(this.distance, this.fuelLevel, this.image, this.modelName,
      this.productionYear, this.longtiude, this.latitude);

  @override
  Widget build(BuildContext context) {
    print("HHHHHHHHHHHHHHHHHH ${double.parse(latitude)}");
    print(double.parse(longtiude));
    // TODO: implement build
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CarsOnMap(
                  carLat: double.parse(latitude),
                  carLang: double.parse(longtiude),
                  carName: modelName,)),
        );
      },
      child: Container(
        // color: Colors.blueAccent,
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.15,
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5,
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Spacer(
                              flex: 1,
                            ),
                            Text(
                              modelName,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Spacer(
                              flex: 1,
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Spacer(
                              flex: 2,
                            ),
                            Text(
                              productionYear,
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            ),
                            Spacer(
                              flex: 2,
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Spacer(
                              flex: 2,
                            ),
                            Icon(Icons.ev_station),
                            Text(fuelLevel,
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white)),
                            Spacer(
                              flex: 2,
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Spacer(
                              flex: 1,
                            ),
                            Icon(Icons.location_on),
                            Text(distance,
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white)),
                            Spacer(
                              flex: 1,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.only(left: 5),
                width: MediaQuery.of(context).size.width * 0.3,
                height: MediaQuery.of(context).size.height * 0.15,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover, image: NetworkImage(image))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
