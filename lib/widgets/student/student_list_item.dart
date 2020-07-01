import 'package:flutter/material.dart';
import 'package:malta/data/models/Student.dart';
import 'package:random_color/random_color.dart';

class StudentListItem extends StatelessWidget {

  final Student student;
  StudentListItem({@required this.student});

  @override
  Widget build(BuildContext context) {
    RandomColor _randomColor = RandomColor();
    Color _color = _randomColor.randomColor(
      colorBrightness: ColorBrightness.light,
      colorSaturation: ColorSaturation.mediumSaturation
      );
    return InkWell(
      child:Container(
        child: Card(
          margin: EdgeInsets.all(8),
          elevation: 1,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
          color: _color,
          child: 
          ListTile(
              leading: Text('Class-${student.name}',
               key: Key('StudentName'),
               style: TextStyle(fontSize: 25,color: Colors.white,
                fontWeight: FontWeight.bold),),
              ),
        )),
        onTap: (){

        },
        );
  }
}