import 'dart:convert';

import 'package:aswaq/api/invoice.dart';
import 'package:aswaq/invoice.dart';
import 'package:flutter/material.dart';

class Invoice {
  int? number;
  String? description;
  List? items;

  Invoice(code,description){
    this.number = code;
    this.description = description;
  }
}

// ignore: must_be_immutable
class InvoiceUIItem extends StatelessWidget {
  Invoice? invoice;
  InvoiceUIItem(invoice){
    this.invoice = invoice;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () async {
          Widget pdf = await InvoiceApi(invoice!.number, invoice!.description).getPDF();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => pdf),
          );
        },
        child: Container(
          height: MediaQuery.of(context).size.height * 0.1,
              decoration: BoxDecoration(
                color: Colors.blue[500],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(invoice!.number.toString(), style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w800),),
                    SizedBox(height: 8,),
                    Text(invoice?.description ?? "", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
}