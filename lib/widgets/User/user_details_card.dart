import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:malta/data/models/user.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class UserDetailsCard extends StatelessWidget {
  final User user;
  UserDetailsCard({this.user});
  @override
  Widget build(BuildContext context) {
    ParseFile file=user['image'];
    String name=user['username'];
   // String email=user.emailAddress;
    return Column(
      children: [
        Card(
          elevation: 0.0,
          color: Colors.transparent,
          child: Column(
            children: [
              CircleAvatar(
                radius: 150,
                backgroundColor: Colors.teal,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(file.url),
                  backgroundColor: Colors.red,
                  radius: 140,
                ),
              ),
            ],
          ),
        ),
        Card(
          color: Colors.grey[350],
          child: ListTile(
            leading: Icon(Icons.supervised_user_circle,color: Colors.teal,),
            title: Text(name),
          ),
        ),
//        Card(
//          color: Colors.grey[350] ,
//          child: ListTile(
//            leading: Icon(Icons.email,color: Colors.teal,),
//            title: Text('email'),
//          ),
//        )
      ],
    );
  }
}
