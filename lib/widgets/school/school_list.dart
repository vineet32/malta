import 'package:flutter/material.dart';
import 'package:malta/data/models/school.dart';
import 'package:malta/widgets/school/school_list_item.dart';

class SchoolList extends StatelessWidget {
  final List<School> schools;

  SchoolList({@required this.schools});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: getSchools(),
    );
  }

  List<Widget> getSchools() {
    return schools.map((school) => SchoolListItem(school: school)).toList();
  }
}
