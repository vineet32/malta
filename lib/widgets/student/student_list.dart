import 'package:flutter/material.dart';
import 'package:malta/widgets/student/student_list_item.dart';

class StudentList extends StatelessWidget {
  final List students;

  StudentList({@required this.students});

  @override
  Widget build(BuildContext context) {
    return ListView(
        scrollDirection: Axis.vertical,
        children: listStudents(),
    );
  }

  List<Widget> listStudents() {
    return students.map((student) => StudentListItem(student: student)).toList();
  }
}