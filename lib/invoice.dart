import 'package:aswaq/api/invoice.dart';
import 'package:aswaq/searchForm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import 'models/item.dart';

List addedItems_ = []; 

// ignore: must_be_immutable
class InvoiceView extends StatefulWidget{
  int? number; 
  String? description;

  InvoiceView({this.number,this.description});  

  @override
  _InvoiceViewState createState() => _InvoiceViewState();
}

class _InvoiceViewState extends State<InvoiceView> {
  InvoiceApi? invoiceApi;
  List addedItems = []; 

  @override
  Widget build(BuildContext context) {
    invoiceApi = InvoiceApi(widget.number, widget.description);  
    return Scaffold(
      appBar: AppBar(
        title: Text("Aswaq"),
      ),
      body: ListView.builder(
              itemCount: addedItems.length + 2,
              itemBuilder: (context,index){
                if(index == 0)
                  return searchForm(); 
                else if(index == 1)
                  return Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Text(
                    'Items',
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 40.0,
                        color: Colors.grey),
                    ),
                  );
                return ItemUI(addedItems[index - 2]); 
              }
            ),
    );
  }
  Widget searchForm() {
    return Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Search Item',
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 40.0,
                      color: Colors.blue),
                ),
                SizedBox(
                  height: 35,
                ),
                TypeAheadField<Item>(
                  hideSuggestionsOnKeyboardHide: true,
                  suggestionsCallback: (str) async {
                    List<Item> items = await InvoiceApi.getItems();
                    return items.where((element) => element.name!.contains(str)) ;  
                  },
                  onSuggestionSelected: (item){
                    setState(() {
                      print(item.name); 
                      print(addedItems); 
                      addedItems.add(item);
                    });
                  },
                  
                  itemBuilder: (context,suggestion){
                    return ListTile(
                      leading: Container(
                        width: 60,
                        height: 60,
                        child: Text(
                          suggestion.name!,
                          ),
                        ),
                      );
                  },
                  noItemsFoundBuilder: (context) => Container(
                  height: 100,
                  child: Center(
                    child: Text(
                      'No items Found',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                textFieldConfiguration: TextFieldConfiguration(
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.text_fields)
                  ),
                ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: 'Code',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.text_fields)
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: MaterialButton(
                    onPressed: () async {
                      invoiceApi = InvoiceApi(widget.number, widget.description);
                      await invoiceApi!.save(itemsToMap());
                    },
                    color: Colors.blue,
                    child: Text(
                      'SAVE',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ); 
  }

  itemsToMap(){
    List tmp = []; 
    for(var i in addedItems){
      int q = addedItems.where((element) => element.code == i.code).length; 
      tmp.add({"itemId": i.id, "quantity": q });
    }
    return tmp; 
  }
}

getAddedItems() async* {
    yield addedItems_; 
}

// ignore: must_be_immutable
class ItemUI extends StatelessWidget {
  Item? item;
  ItemUI(item){
    this.item = item;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
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
                  Text(item!.code ?? "", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w800),),
                  SizedBox(height: 6,),
                  Text(item!.name ?? "", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  
}