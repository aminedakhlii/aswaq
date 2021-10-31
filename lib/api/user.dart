import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'package:aswaq/models/user.dart';

class UserApi extends User {
  UserApi(name, username, password) : super(name, username, password);
  
  Future login() async {
    if(this.username != null && this.password != null) {
      http.Response res = await http.post(
        Uri.parse("http://aliessamtaha1-001-site1.dtempurl.com/api/Authentication/login"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body : jsonEncode({"username": this.username, "password": this.password})
      );
      var response = jsonDecode(res.body); 
      if(response['Errors'] != null)
        return -1; 
      else {
        String token = response["value"];
        String expiration = response["expirationTime"];
        storeToken(token, expiration); 
        //DateTime exp = DateFormat("dd-MM-yyyy hh:ss").parse(response["expirationTime"]); 
      }  
      return res; 
    }
  }

  Future storeToken(token,exp) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    await prefs.setString('exp', exp);
  }

  Future register() async {

  }

  Future listUsers() async {

  }
}