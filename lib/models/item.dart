import 'dart:convert';

class Item {

  String? code, name;
  int? id;
  double? price; 

  Item(id,code,name,price){
    this.id = id; 
    this.code = code; 
    this.name = name; 
    this.price = price; 
  }

  toJson(quantity){
    return jsonDecode('{"id": ' + code! + ', "quantity" : ' + quantity.toString() + ' }'); 
  }
}