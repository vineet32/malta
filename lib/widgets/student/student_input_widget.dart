import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StudentInputWidget extends StatefulWidget {
  final Function(String studentName) onNameChange;
  final Function(String gender) onRadioSwitched;
  final Function(int age) onAgeChange;
  final String studentName;
  final int studentAge;
  final String studentGender;
  StudentInputWidget({this.onNameChange,this.onRadioSwitched,this.onAgeChange,
    this.studentName, this.studentAge, this.studentGender});
  @override
  _StudentInputWidgetState createState() => _StudentInputWidgetState(onNameChange: onNameChange,
    onRadioSwitched: onRadioSwitched,onAgeChange: onAgeChange,studentName: studentName, 
    studentAge: studentAge,studentGender: studentGender);
}

class _StudentInputWidgetState extends State<StudentInputWidget> {
  Function(String studentName) onNameChange;
  Function(String gender) onRadioSwitched;
  Function(int age) onAgeChange;
  final String studentName;
  final int studentAge;
  final String studentGender;
  _StudentInputWidgetState({this.onNameChange,this.onRadioSwitched,this.onAgeChange,
    this.studentName, this.studentAge, this.studentGender});
  String gender;

  TextEditingController studentNameController = TextEditingController();
  TextEditingController studentAgeController = TextEditingController();

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