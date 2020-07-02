import 'package:flutter/material.dart';
import 'package:malta/pages/section_list.dart';
import 'package:malta/pages/teacher_list.dart';

class Administer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Colors.blue,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
                          child: Column(children: [
                SectionList(),
                Padding(padding: EdgeInsets.only(bottom: 5.0)),
                TeacherList()
              ],),
            ),
       ));
       
  }
}
