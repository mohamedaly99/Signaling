import 'dart:convert';

import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> signIn(String email, String password) async {
  Map<String, dynamic> reqBody = {
    "email": email.trim(),
    "password": password.trim()
  };
  
  var response =
      await http.post("http://192.168.1.6:5000/users/signin", body: reqBody);
  var responseBody = response.body;
  Map<String, dynamic> resBody = await jsonDecode(responseBody);
  return resBody;
}
  