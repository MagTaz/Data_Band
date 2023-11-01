import 'dart:convert';
import 'package:data_band/Services/AuthManger.dart';
import 'package:data_band/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Screens/Widgets/ToastWidget.dart';

class APIHandler {


static final String baseUrl = 'http://databand.mywire.org:8088/api/Users/Login';

static Future<void> login(String username, String password,BuildContext context) async {
  final url = Uri.parse(baseUrl);
  final body = {
    'username': username,
    'password': password,
    'rememberMe': false,
  };

  final response = await http.post(
    url,
    body: jsonEncode(body),
    headers: {
      'Content-Type': 'application/json',
    },
  );

  if (response.statusCode == 200) {
    final responseData = jsonDecode(response.body);
    if (responseData['returnValue'] != null) {
      final token = responseData['returnValue']['token'];
    AuthManager.setToken(token);
    Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/EmployeeHomePage',
                  (route) => false,
                );
    ToastWidget.ShowToast(S.of(context).Toast_LoginSuccessful, Colors.green );
    
    
    } else {
      ToastWidget.ShowToast(S.of(context).Toast_UsernameOrPasswordIncorrect, Colors.red );
    }
    
  } else {
   
  }
}

  static Future<Map<String, dynamic>> postData(String endpoint, Map<String, dynamic> data) async {
    final url = Uri.parse('$baseUrl/$endpoint');
    final body = jsonEncode(data);
    final response = await http.post(url, body: body, headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      return responseData;
    } else {
      throw Exception('Failed to post data');
    }
  }
}