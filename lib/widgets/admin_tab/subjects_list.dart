import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:malta/widgets/admin_tab/subject_widget.dart';

class SubjectsList extends StatelessWidget {
  final List subjectsList;

  const SubjectsList({
    Key key,
    @required this.subjectsList,
  })  : assert(subjectsList != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Center(
        child: Wrap(
          runSpacing: 20,
          spacing: 20,
          children: subjectsList.map<Widget>((element) {
            return SubjectWidget(subject: element);
          }).toList(),
        ),
      ),
    );
  }
}
