import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:rentina/model/locationmodel.dart';
import 'package:rentina/services/api/auth/signin.dart';
import 'package:rentina/services/api/cars/getAllCars.dart';
import 'package:rentina/services/conv/getLocation.dart';
import 'package:rentina/services/conv/sortedCar.dart';
import 'package:rentina/views/signin/widgets/get_location.dart';
import 'package:rentina/views/signin/widgets/signuptext.dart';
import 'package:rentina/views/signin/widgets/title.dart';
import 'package:rentina/views/signup/signup.dart';
import 'package:scoped_model/scoped_model.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final formKey = GlobalKey<FormState>();
  String email;
  String password;
  static List<Car> sortedList = List<Car>();
  static Car car = Car(0, 0.0);
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<LocationModel>(
      builder: (context, child, locationModel) {
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
                        decoration:
                            InputDecoration(hintText: "Enter your Password"),
                      ),
                    ),
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
                          signIn(email, password).then((user) => {
                              
                                if (user["message"] != null)
                                  {print("error")}
                                else
                                  {
                                    getLocation().then((myLocation) => {
                                      
                                          getAllCars(myLocation.latitude,myLocation.longitude)
                                              .then((carsList) async => {
                                                    getLocation().then(
                                                        (myLocation) => {
                                                        
                                                              locationModel.setCarList(
                                                                  carsList)
                                                                  ,
                                                                  locationModel.setUserId(user["id"].toString()),
                                                                  
                                                            }),
                                                            
                                                   
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                GetLocationPage()
                                                                
                                                                )
                                                                )
                                                  }),
                                        }),
                                  }
                              });
                        },
                        color: Theme.of(context).primaryColor,
                        child: Text(
                          "Sign in",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SignUpText(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignUp()));
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
