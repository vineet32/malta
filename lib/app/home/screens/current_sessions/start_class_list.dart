import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:malta/app/home/screens/current_sessions/start_class.dart';
import 'package:malta/models/subject.dart';
import 'package:random_color/random_color.dart';

class StartClassList extends StatelessWidget {
  final List<Subject> subjects;

  const StartClassList({Key key, @required this.subjects}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(
      key: PageStorageKey<String>(subjects.hashCode.toString()),
      children: subjects.map((element) {
        RandomColor _randomColor = RandomColor();
        Color _color =
            _randomColor.randomColor(colorBrightness: ColorBrightness.light);
        return StartClass(name: element.name, color: _color);
      }).toList(),
    );
  }
}
