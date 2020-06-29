import 'package:flutter/material.dart';
import 'package:malta/data/models/section.dart';
import 'package:malta/widgets/section/edit_section.dart';
import 'package:random_color/random_color.dart';

class SectionListItem extends StatelessWidget {

  final Section section;
  SectionListItem({@required this.section});

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
          child: ListTile(
              leading: Text('Class-${section.name}',
               key: Key('sectionName'),
               style: TextStyle(fontSize: 25,color: Colors.white,
                fontWeight: FontWeight.bold),),
              trailing: InkWell(child: Icon(Icons.edit), onTap: () async {
                showDialog(
                    context: context,
                    builder: (_) {
                      return EditSection(sectionId: section.objectId,);
                    });
              },)
              ),
        )),
        onTap: (){
          
        },
        );
  }
}