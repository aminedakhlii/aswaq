// Api base URL should be declared here
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String API_URL = "http://aliessamtaha1-001-site1.dtempurl.com/api/";

Future token() async {
  SharedPreferences prefs =  await SharedPreferences.getInstance(); 
  return prefs.getString("token"); 
}

Future validToken() async {
  SharedPreferences prefs =  await SharedPreferences.getInstance(); 
  String? exp = prefs.getString("exp") ?? "10-10-1999 10:00";
  DateTime expDate = DateFormat("dd-MM-yyyy hh:ss").parse(exp);
  print(exp);
  return (expDate.isAfter(DateTime.now()));  
}