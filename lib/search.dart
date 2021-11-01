import 'package:aswaq/models/invoice.dart';
import 'package:aswaq/searchForm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  SearchState createState() => SearchState();
  
}

class SearchState extends State<Search> {

  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
              itemCount: invoiceItems().length + 2,
              itemBuilder: (BuildContext context, int index){
                if(index == 0)
                  return SearchForm();
                else if(index == 1)
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Invoices',
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 40.0,
                          color: Colors.grey),
                      ),
                  );
                return invoiceItems()[index - 2];
              }
            ),
    );
  }

  List<InvoiceUIItem> invoiceItems() {
    List<InvoiceUIItem> tmp = []; 
    for(Invoice i in fakeInvoices()){
      tmp.add(InvoiceUIItem(i));
    }
    print(tmp);
    return tmp;
  }
}

fakeInvoices() {
  List invoices = []; 
  invoices.add(Invoice(2,"Desc"));
  invoices.add(Invoice(2,"Desc"));
  invoices.add(Invoice(2,"Desc"));
  invoices.add(Invoice(2,"Desc"));
  
  return invoices; 
}