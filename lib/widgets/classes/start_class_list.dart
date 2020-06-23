import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:malta/widgets/classes/start_class.dart';
import 'package:random_color/random_color.dart';

class StartClassList extends StatelessWidget {
  final List startClassList;
  const StartClassList({
    Key key,
    this.startClassList,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: startClassList.map<Widget>((element) {
        RandomColor _randomColor = RandomColor();
        Color _color =
            _randomColor.randomColor(colorBrightness: ColorBrightness.light);
        return StartClass(name: element.name, color: _color);
      }).toList(),
    );
  }
}
