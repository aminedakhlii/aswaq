import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SearchForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Search Invoice',
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 40.0,
                      color: Colors.blue),
                ),
                SizedBox(
                  height: 35,
                ),
                TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: 'Number',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.format_list_numbered)
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    labelText: 'Date',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.date_range)
                  ),
                ),
            
                SizedBox(
                  height: 35,
                ),
                Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: MaterialButton(
                    onPressed: () => print("Successul Login."),
                    color: Colors.blue,
                    child: Text(
                      'SEARCH INVOICE',
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
      );
    
  }
}