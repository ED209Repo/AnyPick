import 'package:anypickdemo/Request_Model.dart';
import 'package:anypickdemo/Utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
Future<bool> UserLogin(String phoneNumber, BuildContext context) async {
  String result = '';
  String surl = "https://1c26-206-84-144-36.ngrok-free.app/api/user/login?Devicid=""(context)&Roleid=2&Verified=true&phone=$phoneNumber";

  try {
    final response = await http.post(
      Uri.parse(surl),
      headers: <String, String>{},
    );

    if (response.statusCode == 200) {
      // Successful POST request, handle the response here
      final responseData = jsonDecode(response.body);
      result = 'wadi success';
      print(responseData);
      return true;
    } else {
      // If the server returns an error response, throw an exception
      throw Exception('Failed to post data');
    }
  } catch (e) {
    result = 'Error: $e';
    print(result);
    // Handle the error, e.g., show a snackbar or dialog
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Failed to verify phone number. Please try again.'),
      ),
    );
    return false;
  }
}