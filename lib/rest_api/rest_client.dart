import 'dart:async';
import 'dart:convert';
import 'package:flutter_crud/style/style.dart';
import 'package:http/http.dart' as http;

Future<bool> productCreateRequest(formValues) async {
  // Use 10.0.2.2 for Android Emulator or your local IP for real devices
  var url = Uri.parse('http://10.0.2.2:8000/api/products/create/');
  var postBody = jsonEncode(formValues);
  var postHeader = {"Content-Type":"application/json"};

  var response = await http.post(url,headers: postHeader,body: postBody);

  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);

  if(resultCode == 201){
    successToast("Data Inserted Successfully");
    return true;
  }else{
    errorToast("Something Went Wrong");
    print("Status Code: ${response.statusCode}");
    print("Response Body: ${response.body}");
    return false;
  }
}

Future <List> productReadRequest() async {
  var url = Uri.parse('http://10.0.2.2:8000/api/products/');
  var postHeader = {"Content-Type":"application/json"};
  var response = await http.get(url,headers: postHeader);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);

  if(resultCode == 200){
    successToast("Got the Data");
    return resultBody;
  }else{
    errorToast("No data found");
    return [];
  }
}