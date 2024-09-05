import 'dart:convert';
import 'package:flutter_crud/style/style.dart';
import 'package:http/http.dart' as http;

Future<bool> productCreateRequest(formValues) async {
  // Use 10.0.2.2 for Android Emulator or your local IP for real devices
  var url = Uri.parse('http://10.0.2.2:8000/api/products/create/');
  // var url = Uri.parse('http://127.0.0.1:8000/api/products/create/');
  // var url = Uri.parse('https://crud.teamrabbil.com/api/v1/CreateProduct/');
  var postBody = jsonEncode(formValues);
  var postHeader = {"Content-Type":"application/json"};

  var response = await http.post(url,headers: postHeader,body: postBody);

  var resultCode = response.statusCode;
  var resultBody = jsonDecode(response.body);



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