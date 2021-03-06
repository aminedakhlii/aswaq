import 'package:aswaq/invoice.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NewInvoice extends StatelessWidget {
  int? number; 
  String desc = ""; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Add Invoice',
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 40.0,
                      color: Colors.blue),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Number',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.code)
                  ),
                  onChanged: (nbr) {
                    this.number = int.tryParse(nbr); 
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.description)
                  ),
                  onChanged: (str) {
                    this.desc = str; 
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      if(number != null)
                      Navigator.push(
                      context, MaterialPageRoute(builder: (context) 
                        => InvoiceView(number: number, description: desc,)));
                        },
                    color: Colors.blue,
                    child: Text(
                      'ADD INVOICE',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
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
                    onPressed: () => Navigator.pop(context),
                    color: Colors.blue,
                    child: Text(
                      'BACK',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}