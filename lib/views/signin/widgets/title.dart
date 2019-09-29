import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String text;
  TitleText({this.text});
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 5),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 35,
            color: Theme.of(context).accentColor
          ),
        ),
      ),
    );
  }
}
