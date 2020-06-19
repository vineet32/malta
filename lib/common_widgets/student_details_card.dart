import 'package:flutter/material.dart';
import 'file:///C:/Users/User/Documents/GitHub/malta/lib/models/student.dart';

class StudentDetailsCard extends StatelessWidget {
  final Student student;
  StudentDetailsCard({this.student});
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
              backgroundImage: NetworkImage(student.image),
              backgroundColor: Colors.red,
              radius: 30,
            ),
          ),
          Text(student.name),
          Text(student.standard),
        ],
      ),
    );
  }
}
