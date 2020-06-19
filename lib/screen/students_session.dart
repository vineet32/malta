import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'file:///C:/Users/User/Documents/GitHub/malta/lib/models/student.dart';
import 'package:malta/common_widgets/student_details_card.dart';

class StudentsSession extends StatelessWidget {
 final List<Student> student;
 StudentsSession({this.student});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      crossAxisCount: 3,
      children: student.map((e) {
        return StudentDetailsCard(student: e,);
      }).toList(),
    );
  }


}
