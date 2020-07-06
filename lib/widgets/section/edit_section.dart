import 'package:flutter/material.dart';
import 'package:malta/data/models/school.dart';
import 'package:malta/data/models/section.dart';
import 'package:malta/data/repositories/section/section_contract.dart';
import 'package:malta/providers/school_provider.dart';
import 'package:malta/widgets/section/section_input_widget.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:provider/provider.dart';

class EditSection extends StatelessWidget {
  final String sectionId;
  EditSection({this.sectionId});
  String section;
  ParseFile sectionImg;

  @override
  Widget build(BuildContext context) {
    final sectionContract =
        Provider.of<SectionContract>(context, listen: false);
    final schoolProvider = Provider.of<SchoolProvider>(context, listen: false);
    School currentSchool = schoolProvider.getCurrentlySelectedSchool;
    return AlertDialog(
      scrollable: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: Text('Edit section'),
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
            child: Text('Update'),
            onPressed: () async {
              await sectionContract.update(
                  Section()
                  ..objectId = sectionId
                  ..set(Section.keyName, section)
                  ..set(Section.keyImage, sectionImg )
                  ..set(Section.keySchool, { "__type": "Pointer", "className": "School", "objectId": currentSchool.objectId.toString() })
                );
                Navigator.pop(context);
            },
          )
        ])
      ],
      content: SingleChildScrollView(child: SectionInputWidget(
        onNameChange: (name) {section = name;},
        onImageSelect: (value) {sectionImg = value;},
      ))
      
    );
  }
}
