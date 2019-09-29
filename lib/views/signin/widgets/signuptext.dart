import 'package:flutter/material.dart';

class SignUpText extends StatelessWidget {
  final void Function() onTap;
  SignUpText({this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Container(
          margin: EdgeInsets.only(top: 70),
          child: Text(
            "Not a user? Sign up",
            style: TextStyle(
              color: Colors.black,
              fontSize: 17
            ),
          ),
        ),
      ),
    );
  }
}
