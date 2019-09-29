

import 'package:http/http.dart' as http;

Future<String> signUp(String email, String password, String name,
    String nationality, int age) async {
  print("$email $password $name $nationality $age");
  Map<String, dynamic> reqBody = {
    "email": email,
    "password": password,
    "name": name,
    "nationality": nationality,
    "age": "$age"
  };
  

  print(reqBody);
  var response =
      await http.post("http://192.168.1.4:5000/users/signup", body: reqBody);
  if (response.statusCode == 200) {
    return "success";
  } else {
    return response.body;
  }
}
