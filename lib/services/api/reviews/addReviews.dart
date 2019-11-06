import 'dart:convert';

import 'package:http/http.dart' as http;

Future<String> addReviews(String reviewerId, String carId, String review) async {
  
  Map<String, dynamic> reqBody = {
    "reviewerId": reviewerId,
    "carId": carId,
    "review": review,
  };
  print(reqBody);
  var response =
      await http.post("http://192.168.1.6:5000/review/addreview", body: reqBody);
      
      print(response);
  if (response.statusCode == 200) {
    return "success";
  } else {
    return response.body;
  }
}
