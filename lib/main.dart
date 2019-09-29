
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rentina/services/user_location.dart';
import 'package:rentina/views/map/map.dart';
import 'package:rentina/views/signin/signin.dart';
import 'package:rentina/views/signin/widgets/get_location.dart';

import 'services/loaction_services.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);


// StreamProvider<UserLocation>
//     (builder: (context) =>LocationService().locationStream,
//     child: MaterialApp(theme: ThemeData(
//            primaryColor: Color(0xff416aa6), accentColor: Color(0xff416aa6)),
//            home: SignIn()),
    
//     );



    return MaterialApp(
      theme: ThemeData(
          primaryColor: Color(0xff416aa6), accentColor: Color(0xff416aa6)),
      home: SignIn(),
    );
  }
}
