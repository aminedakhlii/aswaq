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
      /*shrinkWrap: true,
      children: [
        SearchForm(),
        //ListView(children: invoiceItems())
      ],
    );*/
  
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
  invoices.add(Invoice("Invoice#x","Desc",4,23));
  invoices.add(Invoice("Invoice#x","Desc",3,25));
  invoices.add(Invoice("Invoice#x","Desc",2,200));
  invoices.add(Invoice("Invoice#x","Desc",10,123));
  
  return invoices; 
}