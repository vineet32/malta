import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class StudentInputWidget extends StatefulWidget {
  final Function(String studentName) onNameChange;
  final Function(String gender) onRadioSwitched;
  final Function(int age) onAgeChange;
  final String studentName;
  final int studentAge;
  final String studentGender;
  final Function(ParseFile studentImage) onImageSelect;
  StudentInputWidget({this.onNameChange,this.onRadioSwitched,this.onAgeChange,
    this.studentName, this.studentAge, this.studentGender, this.onImageSelect});
  @override
  _StudentInputWidgetState createState() => _StudentInputWidgetState(onNameChange: onNameChange,
    onRadioSwitched: onRadioSwitched,onAgeChange: onAgeChange,studentName: studentName, 
    studentAge: studentAge,studentGender: studentGender,onImageSelect: onImageSelect);
}

class _StudentInputWidgetState extends State<StudentInputWidget> {
  Function(String studentName) onNameChange;
  Function(String gender) onRadioSwitched;
  Function(int age) onAgeChange;
  final String studentName;
  final int studentAge;
  final String studentGender;
  Function(ParseFile studentImage) onImageSelect;
  _StudentInputWidgetState({this.onNameChange,this.onRadioSwitched,this.onAgeChange,
    this.studentName, this.studentAge, this.studentGender, this.onImageSelect});
  String gender;

  TextEditingController studentNameController = TextEditingController();
  TextEditingController studentAgeController = TextEditingController();

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
  void initState(){
    super.initState();
    gender = studentGender;
  }

  void setGender(String value) {
    setState(() {
      gender = value;
      onRadioSwitched(gender);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children:[
          InkWell(
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
    ),
      TextField(
        controller: studentNameController..text = studentName,
        decoration: InputDecoration(
            labelText: 'Name',
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black))),
        onChanged: (value) {
          onNameChange(value);
        },
      ),
      
      ButtonBar(children: [
        Text('Male'),
        Radio(value: 'male', groupValue: gender, onChanged: (value){setGender(value);}),
        Text('Female'),
        Radio(value: 'female', groupValue: gender, onChanged: (value){setGender(value);})
      ]),

      TextField(
        controller: studentAgeController..text = studentAge.toString(),
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
        WhitelistingTextInputFormatter.digitsOnly],
        decoration: InputDecoration(
            labelText: 'Age',
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black))),
        onChanged: (value) {
          onAgeChange(int.parse(value));
        },
      ),
        ]
      ),  
    );
  }
}