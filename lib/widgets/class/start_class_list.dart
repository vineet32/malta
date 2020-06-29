import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:malta/data/models/school.dart';
import 'package:malta/data/models/user.dart';
import 'package:malta/widgets/class/start_class_widget.dart';
import 'package:random_color/random_color.dart';

class StartClassList extends StatelessWidget {
  final List startClassList;
  final School school;
  final User teacher;
  const StartClassList({
    Key key,
    @required this.startClassList,
    @required this.school,
    @required this.teacher,
  })  : assert(startClassList != null),
        assert(school != null),
        assert(teacher != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: startClassList.map<Widget>((element) {
        RandomColor _randomColor = RandomColor();
        Color _color =
            _randomColor.randomColor(colorBrightness: ColorBrightness.light);
        return StartClassWidget(
          color: _color,
          subject: element,
          school: school,
          teacher: teacher,
        );
      }).toList(),
    );
  }
}
