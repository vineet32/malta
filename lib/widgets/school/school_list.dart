import 'package:flutter/material.dart';
import 'package:malta/widgets/school/school_list_item.dart';
import 'package:malta/data/models/school.dart';

class SchoolList extends StatelessWidget {
  final List<School> schools;
  SchoolList({this.schools}) : assert(schools != null);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
              title: Text('Choose your school'),
            ),
            body: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: ListView(
                    children: getSchools(),
              )));
  }

  List<Widget> getSchools() {
    return schools.map((school) => SchoolListItem(school: school)).toList();
  }
}