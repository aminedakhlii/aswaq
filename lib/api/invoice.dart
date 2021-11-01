import 'dart:convert';

import 'package:aswaq/api/apiGlobal.dart';
import 'package:aswaq/models/item.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:http/http.dart' as http;
import 'package:aswaq/models/invoice.dart';

class InvoiceApi extends Invoice {
  InvoiceApi(number, description) : super(number, description);

  Future save(itemsList) async {
    if(itemsList != null) {
      http.Response res = await http.post(
        Uri.parse(API_URL + "Invoice/saveInvoice"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ' + await token(),
        },
        body : jsonEncode({"items" : itemsList})
      );
      print(res.statusCode); 
      return res; 
    }
  }

  Future getPDF() async {
    if(this.number != null) {
      http.Response res = await http.get(
        Uri.parse(API_URL + "Invoice/viewInvoicePDF?invoiceNumber="+ this.number.toString()),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ' + await token(),
        },
      );
      //if the pdf is to be returned as url use 
      return PDF(swipeHorizontal: true,).cachedFromUrl(API_URL + "Invoice/viewInvoicePDF?invoiceNumber="+ this.number.toString());
      //return res; 
    }
  }

  static Future<List<Item>> getItems() async {
      String tokenStr = await token(); 
      print(tokenStr);
      http.Response res = await http.get(
        Uri.parse(API_URL + "Lookup/getItems"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ' + tokenStr,
        },
      );
      var resJson = jsonDecode(res.body);
      List<Item> fetchedItems = [];
      for(var i in resJson){
        print(i['price'].runtimeType);
        Item tmp = Item(i['id'],i['code'],i['name'],i['price']);
        fetchedItems.add(tmp);
      }
      print(fetchedItems);
      return fetchedItems; 
    
  }
  
}