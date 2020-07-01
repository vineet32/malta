import 'package:flutter/material.dart';
import 'package:malta/data/models/school.dart';
import 'package:malta/pages/home_page.dart';
import 'package:malta/providers/school_provider.dart';
import 'package:random_color/random_color.dart';
import 'package:provider/provider.dart';

class SchoolListItem extends StatelessWidget {

  final School school;
  SchoolListItem({@required this.school});

  @override
  Widget build(BuildContext context) {
    RandomColor _randomColor = RandomColor();
    Color _color = _randomColor.randomColor(
      colorBrightness: ColorBrightness.light,
      colorSaturation: ColorSaturation.mediumSaturation
      );
    return Builder(builder: (context){
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
              contentPadding: EdgeInsets.fromLTRB(5.0, 15.0, 5.0, 0.0),
              title: Text(school.name, key: Key('schoolName'),
              style: TextStyle(fontSize: 20,color: Colors.white,
                fontWeight: FontWeight.bold),),  
              trailing: CircleAvatar(
                child: Icon(
                  Icons.image,
                ),
                key: Key('schoolImage'),
                radius: 40,
              )),
        )),
        onTap: (){
          final schoolProvider = Provider.of<SchoolProvider>(context, listen: false);
          schoolProvider.setCurrentlySelectedSchool(school);
           Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
        },
        );
    });
    
  }
}