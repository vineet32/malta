import 'package:flutter/material.dart';
import 'package:malta/widgets/teacher/teacher_list_item.dart';

class TeacherList extends StatelessWidget {
  final List teachers;

  TeacherList({@required this.teachers});

  @override
  Widget build(BuildContext context) {
    return ListView(
        scrollDirection: Axis.vertical,
        children: listTeachers(),
    );
  }

  List<Widget> listTeachers() {
    return teachers.map((teacher) => TeacherListItem(user: teacher)).toList();
  }
}