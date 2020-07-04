import 'package:flutter/material.dart';
import 'package:malta/data/models/school.dart';
import 'package:malta/data/models/section.dart';
import 'package:malta/data/models/student.dart';
import 'package:malta/data/repositories/student/student_contract.dart';
import 'package:malta/providers/school_provider.dart';
import 'package:malta/widgets/student/student_input_widget.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:provider/provider.dart';

class EditStudent extends StatefulWidget {
  final Section section;
  final Student student;
  EditStudent({this.section, this.student});
  
  @override
  _EditStudentState createState() => _EditStudentState(section: section, student: student);
}

class _EditStudentState extends State<EditStudent> {
  Section section;
  Student student;
  _EditStudentState({this.section, this.student});
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
      title: Text('Update student'),
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
              await studentContract.update(
                  Student()
                  ..objectId = widget.student.objectId
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
          studentName: student.name,studentAge: student.age,
          studentGender: student.gender,
          onImageSelect: (value) {studentImg = value;},
        ),
      )
    );
  }
}