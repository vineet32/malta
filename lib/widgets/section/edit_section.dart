import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:malta/data/models/school.dart';
import 'package:malta/data/models/section.dart';
import 'package:malta/data/repositories/section/section_contract.dart';
import 'package:malta/providers/school_provider.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:provider/provider.dart';

class EditSection extends StatefulWidget {

  final String sectionId;
  EditSection({this.sectionId});

  @override
  _EditSectionState createState() => _EditSectionState();
}

class _EditSectionState extends State<EditSection> {
  String section;
  TextEditingController sectionController = TextEditingController();

  static PickedFile image;
  final ImagePicker _picker = ImagePicker();
  Future<File> getImage() async {
    image = await _picker.getImage(source: ImageSource.gallery);
    setState((){});
    return File(image?.path);
  }
  static File sectionImage;
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
      title: InkWell(
              child: CircleAvatar(
          child: image == null?Icon(
            Icons.photo_camera,
            size: 20,
          ):Image.file(File(image.path)),
          radius: 30,
        ),
        onTap: () async {
          sectionImage = await getImage();
          sectionImg = ParseFile(sectionImage);
        }
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
            child: Text('Update'),
            onPressed: () async {
              await sectionContract.update(
                  Section()
                  ..objectId = widget.sectionId
                  ..set(Section.keyName, section)
                  ..set(Section.keyImage, sectionImg )
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
