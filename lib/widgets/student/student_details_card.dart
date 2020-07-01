import 'package:flutter/material.dart';



class StudentDetailsCard extends StatelessWidget {
  final String imageLink;
  final String name;
  final String section;
  StudentDetailsCard({this.name,this.section,this.imageLink});
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
              backgroundImage: NetworkImage(imageLink),
              backgroundColor: Colors.red,
              radius: 30,
            ),
          ),
          Text(name),
          Text('Class-$section'),
        ],
      ),
    );
  }
}
