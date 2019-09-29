
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rentina/views/map/map.dart';
import 'package:rentina/views/signin/signin.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Color(0xff416aa6), accentColor: Color(0xff416aa6)),
      home: SignIn(),
    );
  }
}
