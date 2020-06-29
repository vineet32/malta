import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:malta/data/models/school.dart';
import 'package:malta/data/models/subject.dart';
import 'package:malta/data/models/user.dart';
import 'package:malta/pages/display_sections.dart';

class StartClassWidget extends StatelessWidget {
  final Color color;
  final Subject subject;
  final School school;
  final User teacher;

  const StartClassWidget(
      {Key key,
      @required this.color,
      @required this.subject,
      @required this.school,
      @required this.teacher})
      : assert(color != null),
        assert(subject != null),
        assert(school != null),
        assert(teacher != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FlatButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DisplaySections(
                subject: subject,
                school: school,
                teacher: teacher,
              ),
            ),
          );
        },
        child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(40),
          ),
          alignment: Alignment.center,
          child: Text(
            subject.name,
          ),
        ),
      ),
    );
  }
}
