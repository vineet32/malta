import 'package:flutter/material.dart';
import 'package:malta/data/models/school.dart';
import 'package:malta/data/models/section.dart';
import 'package:malta/data/repositories/section/section_contract.dart';
import 'package:malta/providers/school_provider.dart';
import 'package:provider/provider.dart';

class AddSection extends StatelessWidget {
  String section;
  TextEditingController sectionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final sectionContract =
        Provider.of<SectionContract>(context, listen: false);
    final schoolProvider = Provider.of<SchoolProvider>(context, listen: false);
    School currentSchool = schoolProvider.getCurrentlySelectedSchool;
    return AlertDialog(
      scrollable: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: CircleAvatar(
        child: Icon(
          Icons.photo_camera,
          size: 40,
        ),
        radius: 30,
      ),
      actions: [
        ButtonBar(children: [
          FlatButton(
                key: Key('cancelButton'),
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
          RaisedButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Text('Add'),
            onPressed: () async {
              await sectionContract.add(
                  Section()
                  ..set(Section.keyName, section)
                  ..set(Section.keyImage,'imagUrl ${currentSchool.name}')
                  ..set(Section.keySchool, { "__type": "Pointer", "className": "School", "objectId": currentSchool.objectId.toString() })
                );
               Navigator.pop(context); 
            },
          )
        ])
      ],
      content: TextField(
        controller: sectionController,
        decoration: InputDecoration(
            labelText: 'Section',
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black))),
        onChanged: (value) {
          section = value;
        },
      ),
      
    );
  }
}
