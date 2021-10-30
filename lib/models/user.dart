import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class User {
  String? username, name, password;

  User(name,username,password){
    this.name = name;
    this.username = username;
    this.password = password;
  }

  static List<User>? getUsers(){
    return null; 
  }
}

// ignore: must_be_immutable
class UserItem extends StatelessWidget {
  User? user;
  UserItem(user){
    this.user = user;
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
                  Text(user?.name ?? "", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w800),),
                  SizedBox(height: 8,),
                  Text(user?.username ?? "", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500)),
                ],
              ),
              FloatingActionButton(
                onPressed: (){},
                child: Icon(
                  Icons.delete
                ),
                shape: StadiumBorder(
                  side: BorderSide(
                    color: Colors.white, width: 1
                  )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}