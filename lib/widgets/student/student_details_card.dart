import 'package:flutter/material.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';



class StudentDetailsCard extends StatelessWidget {
  final ParseFile image;
  final String name;
  final String section;
  StudentDetailsCard({this.name,this.section,this.image});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.teal,
            child: CircleAvatar(
              backgroundImage: NetworkImage(image.url),
              backgroundColor: Colors.red,
              radius: 30,
            ),
          ),
          Text(name),
          Text('$section'),
        ],
      ),
    );
  }
}
