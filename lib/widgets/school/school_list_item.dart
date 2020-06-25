import 'package:flutter/material.dart';
import 'package:malta/data/models/school.dart';
import 'package:random_color/random_color.dart';

class SchoolListItem extends StatelessWidget {
  final School school;
  SchoolListItem({@required this.school});

  @override
  Widget build(BuildContext context) {
    RandomColor _randomColor = RandomColor();
    Color _color = _randomColor.randomColor();
    return Container(
        height: 100,
        child: Card(
          margin: EdgeInsets.all(8),
          elevation: 1,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
          color: _color,
          child: ListTile(
              title: Text(school.name),
              trailing: CircleAvatar(
                child: Icon(
                  Icons.image,
                ),
                key: Key('schoolImage'),
                radius: 40,
              )),
        ));
  }
}
