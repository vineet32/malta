import 'package:flutter/material.dart';
import 'package:malta/data/models/school.dart';

class SchoolListItem extends StatelessWidget {
  final School school;

  SchoolListItem({@required this.school});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 1),
        child: Card(
          elevation: 1,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
          color: Colors.white,
          child: ListTile(
              title: Text(school.name),
              trailing: CircleAvatar(
                child: Icon(
                  Icons.image,
                ),
                key: Key('schoolImage'),
                radius: 20,
              )),
        ));
  }
}