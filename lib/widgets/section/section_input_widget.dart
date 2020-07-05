import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
class SectionInputWidget extends StatefulWidget {
  final Function(ParseFile sectionImage) onImageSelect;
  final Function(String sectionName) onNameChange;
  SectionInputWidget({this.onImageSelect, this.onNameChange});
  @override
  _SectionInputWidgetState createState() => _SectionInputWidgetState(onImageSelect: onImageSelect,
    onNameChange: onNameChange);
}

class _SectionInputWidgetState extends State<SectionInputWidget> {
  Function(ParseFile sectionImage) onImageSelect;
  Function(String sectionName) onNameChange;
  _SectionInputWidgetState({this.onImageSelect, this.onNameChange});

  static PickedFile image;
  final ImagePicker _picker = ImagePicker();
  Future<File> getImage() async {
    try{
      image = await _picker.getImage(source: ImageSource.gallery);
    }on Exception catch(e){
      print(e);
    }
    setState((){});
    if(image?.path != null){
      return File(image?.path);
    }
    return null;
  }
  static File sectionImage;
  TextEditingController sectionController = TextEditingController();
  String section;
  ParseFile sectionImg;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          InkWell(
              child: CircleAvatar(
          child: image == null?Icon(
            Icons.photo_camera,
            size: 20,
          ):Image.file(File(image.path)),
          radius: 30,
        ),
        onTap: () async {
          if(!kIsWeb){
          sectionImage = await getImage();
          sectionImg = ParseFile(sectionImage);
          onImageSelect(sectionImg);
          }
        }
      ),
      TextField(
        controller: sectionController,
        decoration: InputDecoration(
            labelText: 'Section',
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black))),
        onChanged: (value) {
          onNameChange(value);
        },
      ),
        ]
      ),
      
    );
  }
}