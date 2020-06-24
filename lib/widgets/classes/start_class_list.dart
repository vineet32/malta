import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:malta/widgets/classes/start_class_widget.dart';
import 'package:random_color/random_color.dart';

class StartClassList extends StatelessWidget {
  final List startClassList;
  const StartClassList({
    Key key,
    this.startClassList,
  })  : assert(startClassList != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: startClassList.map<Widget>((element) {
        RandomColor _randomColor = RandomColor();
        Color _color =
            _randomColor.randomColor(colorBrightness: ColorBrightness.light);
        return StartClassWidget(
          name: element.name,
          color: _color,
        );
      }).toList(),
    );
  }
}
