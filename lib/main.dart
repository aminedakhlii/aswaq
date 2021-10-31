import 'package:aswaq/addInvoice.dart';
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

  bool checkLogged = true;
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
      body: (checkLogged) ? screens[_selectedIndex] : Login(),

      bottomNavigationBar: (checkLogged) ? BottomNavigationBar(
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
      ) : null ,
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}

List screens = [
  Search(),
  UserList(),
  NewInvoice(),
  Register(),
];
