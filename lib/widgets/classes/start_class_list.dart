import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:malta/story_board/story/current_classes_story_database.dart';
import 'package:malta/widgets/classes/start_class.dart';
import 'package:random_color/random_color.dart';

class StartClassList extends StatelessWidget {
  const StartClassList({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: ClassesStoryDataBase().testSubjectStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: snapshot.data.map<Widget>((element) {
                RandomColor _randomColor = RandomColor();
                Color _color = _randomColor.randomColor(
                    colorBrightness: ColorBrightness.light);
                return StartClass(name: element.name, color: _color);
              }).toList(),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
