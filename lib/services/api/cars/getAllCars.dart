import 'dart:convert';

import 'package:http/http.dart' as http;

Future<List<dynamic>> getAllCars (double lat, double long ) async {
  Map body = {
    "lat":lat,
    "long":long
  };
   Map<String,String> headers = {"Content-type":"application/json"};
  var bodyready = jsonEncode(body);
  var response =
      await http.post("http://192.168.43.216:5000/cars/getallcars",body: bodyready,headers: headers);
  var resBody = response.body;
   print(lat);
   print(long);
  List<dynamic> obj = await jsonDecode(resBody);

  return obj;
}