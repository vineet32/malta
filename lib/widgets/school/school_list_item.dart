import 'package:flutter/material.dart';
import 'package:malta/data/models/school.dart';
import 'package:malta/providers/school_provider.dart';
import 'package:random_color/random_color.dart';
import 'package:provider/provider.dart';
import 'package:malta/pages/current_school.dart';

class SchoolListItem extends StatelessWidget {
  final School school;
  SchoolListItem({@required this.school});

  @override
  Widget build(BuildContext context) {
    final schoolProvider = Provider.of<SchoolProvider>(context, listen: false);
    RandomColor _randomColor = RandomColor();
    Color _color = _randomColor.randomColor();
    return InkWell(
      child:Container(
        height: 100,
        child: Card(
          margin: EdgeInsets.all(8),
          elevation: 1,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
          color: _color,
          child: ListTile(
              title: Text(school.name, key: Key('schoolName'),),
              trailing: CircleAvatar(
                child: Icon(
                  Icons.image,
                ),
                key: Key('schoolImage'),
                radius: 40,
              )),
        )),
        onTap: (){
          schoolProvider.setCurrentlySelectedSchool(school);
          Navigator.push(context, MaterialPageRoute(builder: (context) => CurrentSchool()));
        },
        );
  }
}
