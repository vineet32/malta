import 'package:flutter/material.dart';
import 'package:malta/data/models/user.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';



class ShowUser extends StatelessWidget {
  final User user;
  ShowUser({this.user});
  @override
  Widget build(BuildContext context) {
    ParseFile file=user['image'];
    String name=user['username'];
    return Card(
      elevation: 0.0,
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.teal,
            child: CircleAvatar(
              backgroundImage: NetworkImage(file.url),
              backgroundColor: Colors.red,
              radius: 45,
            ),
          ),
          Text('$name'),
        ],
      ),
    );
  }
}
