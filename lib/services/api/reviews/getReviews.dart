import 'dart:convert';

import 'package:http/http.dart' as http;

Future<List<dynamic>> getReviews(String id) async {
  Map reqBody = {
    "carId": id.trim()
  
  } ;
  
  var response =
      await http.post("http://192.168.1.6:5000/review/getreviewbyid", body:reqBody);
  var responseBody = response.body;
  
  List< dynamic> resBody = await jsonDecode(responseBody);
 
  return resBody;
}
  