import 'package:flutter/material.dart';
import 'package:malta/data/models/school.dart';
import 'package:malta/data/models/section.dart';
import 'package:malta/data/models/student.dart';
import 'package:malta/data/repositories/student/student_contract.dart';
import 'package:malta/providers/school_provider.dart';
import 'package:malta/widgets/student/student_image_widget.dart';
import 'package:malta/widgets/student/student_input_widget.dart';
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
  ParseFile studentImg;
  String studentName;
  String gender;
  int studentAge;

  @override
  Widget build(BuildContext context) {
    final schoolProvider = Provider.of<SchoolProvider>(context, listen: false);
    School currentSchool = schoolProvider.getCurrentlySelectedSchool;
    final studentContract = Provider.of<StudentContract>(context);
    return AlertDialog(
      scrollable: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: StudentImageWidget(onImageSelect: (value){studentImg = value;},),
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
        child: StudentInputWidget(
          onNameChange: (name) {studentName = name;},
          onRadioSwitched: (value) {gender = value;},
          onAgeChange: (age) {studentAge = age;},
        )
      )
    );
  }
}
