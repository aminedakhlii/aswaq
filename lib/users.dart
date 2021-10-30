import 'package:aswaq/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserList extends StatefulWidget {
  UserListState createState() => UserListState();
}

class UserListState extends State<UserList> {

  @override
  Widget build(BuildContext context) {
    print(userItems());
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top : 35.0),
        child: Container(
          child: Center(
            child: ListView(
              children: userItems(),
            ),
          ),
        ),
      ),
    );
  }

  List<UserItem> userItems() {
    List<UserItem> tmp = []; 
    for(User u in fakeUsers()){
      tmp.add(UserItem(u));
    }
    print(tmp);
    return tmp;
  }
}

fakeUsers() {
  List users = []; 
  users.add(User("Steve","Steve1","password"));
  users.add(User("Bill","Bill1","password"));
  users.add(User("Elon","Elon1","password"));
  users.add(User("Jeff","Jeff1","password"));
  
  for(var u in users){
    print(u.name);
  }
  return users; 
}