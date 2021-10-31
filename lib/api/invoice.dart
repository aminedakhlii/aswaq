import 'dart:convert';

import 'package:aswaq/api/apiGlobal.dart';
import 'package:http/http.dart' as http;
import 'package:aswaq/models/invoice.dart';

class InvoiceApi extends Invoice {
  InvoiceApi(code, description, quantity, price) : super(code, description, quantity, price);

  Future save() async {
    if(this.items != null) {
      http.Response res = await http.post(
        Uri.parse(API_URL + "Invoice/saveInvoice"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body : jsonEncode({"items": this.items})
      );
      print(res.body); 
      return res; 
    }
  }

  Future getPDF() async {
    if(this.code != null) {
      http.Response res = await http.get(
        Uri.parse(API_URL + "Invoice/viewInvoicePDF?invoiceNumber="+ this.code.toString()),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      print(res.body); 
      return res; 
    }
  }

  Future getItems(code,name) async {
    if(code != null && name != null) {
      final params = {
        "code": code,
        "name": name
      }; 
      
      http.Response res = await http.get(
        Uri.http(API_URL, "Lookup/getItems",params),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      print(res.body); 
      return res; 
    }
  }
  
}