import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_country_picker/flutter_country_picker.dart';
import 'package:rentina/services/api/auth/signup.dart';
import 'package:rentina/views/signin/signin.dart';
import 'package:rentina/views/signin/widgets/title.dart';



class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formKey = GlobalKey<FormState>();
  String email, password, name, nationality;
  int age;
  Country pickedCountry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: formKey,
      child: Container(
          color: Colors.white,
          child: ListView(
            children: <Widget>[
              TitleText(
                text: "Rentina",
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 30,
                  width: MediaQuery.of(context).size.width * 0.8,
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.1),
                  child: TextFormField(
                    onSaved: (nameInput) => name = nameInput,
                    decoration: InputDecoration(
                      hintText: "Enter your Name",
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 30,
                  width: MediaQuery.of(context).size.width * 0.8,
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.05),
                  child: TextFormField(
                    onSaved: (emailInput) => email = emailInput,
                    decoration: InputDecoration(
                      hintText: "Enter your Email",
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 30,
                  width: MediaQuery.of(context).size.width * 0.8,
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.05),
                  child: TextFormField(
                    onSaved: (passwordInput) => password = passwordInput,
                    decoration: InputDecoration(
                      hintText: "Enter your Password",
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 30,
                  width: MediaQuery.of(context).size.width * 0.8,
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.05),
                  child: TextFormField(
                    onSaved: (ageInput) => age = int.parse(ageInput),
                    decoration: InputDecoration(
                      hintText: "Enter your Age",
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.05),
                    height: 30,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: CountryPicker(
                      dense: false,
                      showFlag: true, //displays flag, true by default
                      showDialingCode:
                          false, //displays dialing code, false by default
                      showName: true, //displays country name, true by default
                      onChanged: (Country country) {
                        setState(() {
                          nationality = country.name;
                          pickedCountry = country;
                        });
                      },
                      selectedCountry: pickedCountry,
                    )),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.04),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    onPressed: () {
                      formKey.currentState.save();
                      signUp(email, password, name, nationality, age)
                          .then((result) => {
                                if (result == "success")
                                  {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SignIn()))
                                  }
                                else
                                  {print(result)}
                              });
                    },
                    color: Theme.of(context).primaryColor,
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
    ));
  }
}
