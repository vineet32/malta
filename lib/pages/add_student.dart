import 'dart:io';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:malta/data/models/school.dart';
import 'package:malta/data/models/section.dart';
import 'package:malta/data/models/student.dart';
import 'package:malta/data/repositories/student/student_contract.dart';
import 'package:malta/providers/school_provider.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:provider/provider.dart';

class AddStudent extends StatefulWidget {
  final Section section;
  AddStudent({this.section});
  
  @override
  _AddStudentState createState() => _AddStudentState(section: section);
}

class _AddStudentState extends State<AddStudent> {
  Section section;
  _AddStudentState({this.section});
  
  static PickedFile image;
  final ImagePicker _picker = ImagePicker();
  Future<File> getImage() async {
    image = await _picker.getImage(source: ImageSource.gallery);
    setState((){});
    return File(image?.path != null?image?.path: null);
  }
  static File studentImage;
  ParseFile studentImg;

  String studentName;
  String gender;
  int studentAge;
  TextEditingController studentNameController = TextEditingController();
  TextEditingController studentAgeController = TextEditingController();

  @override 
  void initState(){
    super.initState();
    gender = 'male';
  }

  void setGender(String value) {
    setState(() {
      gender = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final schoolProvider = Provider.of<SchoolProvider>(context, listen: false);
    School currentSchool = schoolProvider.getCurrentlySelectedSchool;
    final studentContract = Provider.of<StudentContract>(context);
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
          studentImage = await getImage();
          studentImg = ParseFile(studentImage);
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
            child: Text('Add'),
            onPressed: () async {
              await studentContract.add(
                  Student()
                  ..set(Student.keyName, studentName)
                  ..set(Student.keyImage, studentImg)
                  ..set(Student.keySchool, { "__type": "Pointer", "className": "School", 
                  "objectId": currentSchool.objectId.toString() })
                  ..set(Student.keySection, { "__type": "Pointer", "className": "Section", 
                  "objectId": section.objectId.toString() })
                  ..set(Student.keyGender, gender)
                  ..set(Student.keyAge, studentAge)
                );
               Navigator.pop(context); 
            },
          )
        ])
      ],
      content: SingleChildScrollView(
        child: Container(
      child: Column(
        children:[
      TextField(
        controller: studentNameController,
        decoration: InputDecoration(
            labelText: 'Name',
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black))),
        onChanged: (value) {
          studentName = value;
        },
      ),
      
      ButtonBar(children: [
        Text('Male'),
        Radio(value: 'male', groupValue: gender, onChanged: (value){setGender(value);}),
        Text('Female'),
        Radio(value: 'female', groupValue: gender, onChanged: (value){setGender(value);})
      ]),

      TextField(
        controller: studentAgeController,
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
        WhitelistingTextInputFormatter.digitsOnly],
        decoration: InputDecoration(
            labelText: 'Age',
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black))),
        onChanged: (value) {
          studentAge = int.parse(value);
        },
      ),
        ]
      ),  
    ),
      )
    );
  }
}
