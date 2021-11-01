import 'package:aswaq/addInvoice.dart';
import 'package:aswaq/api/apiGlobal.dart';
import 'package:aswaq/login.dart';
import 'package:aswaq/register.dart';
import 'package:aswaq/search.dart';
import 'package:aswaq/searchForm.dart';
import 'package:aswaq/users.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aswaq',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Aswaq'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _selectedIndex = 0; 

  _onItemTapped(index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
      ),
      body: FutureBuilder(
        future: validToken(),
        builder: (context, snapshot) {
          if(snapshot.data == true)
            return screens[_selectedIndex]; 
          return Login();
        }
      ),

      bottomNavigationBar: FutureBuilder(
        future: validToken(),
        builder: (context, snapshot) {
          if(snapshot.data == true)
            return BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.inventory),
                  label: 'Invoices',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.people),
                  label: 'Users',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.add),
                  label: 'Add User',
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.blue[600],
              onTap: _onItemTapped,
            );
          return SizedBox();   
        }
      ),
    );
  }
}

List screens = [
  Search(),
  UserList(),
  Register(),
];
