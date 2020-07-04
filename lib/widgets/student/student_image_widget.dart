import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class StudentImageWidget extends StatefulWidget {
  final Function(ParseFile studentImage) onImageSelect;
  StudentImageWidget({this.onImageSelect});
  @override
  _StudentImageWidgetState createState() => _StudentImageWidgetState(onImageSelect: onImageSelect);
}

class _StudentImageWidgetState extends State<StudentImageWidget> {
  final Function(ParseFile studentImage) onImageSelect;
  _StudentImageWidgetState({this.onImageSelect});

  static PickedFile image;
  final ImagePicker _picker = ImagePicker();
  Future<File> getImage() async {
    image = await _picker.getImage(source: ImageSource.gallery);
    setState((){});
    return File(image?.path != null?image?.path: null);
  }
  static File studentImage;
  ParseFile studentImg;

  @override
  Widget build(BuildContext context) {
    return InkWell(
              child: CircleAvatar(
          child: image == null?Icon(
            Icons.photo_camera,
            size: 20,
          ):Image.file(File(image.path)),
          radius: 30,
        ),
        onTap: () async {
          studentImage = await getImage();
          studentImg = ParseFile(studentImage);
          onImageSelect(studentImg);
        }
    );
  }
}