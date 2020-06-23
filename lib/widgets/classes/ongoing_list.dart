import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:malta/story_board/story/current_classes_story_database.dart';
import 'package:malta/widgets/classes/ongoing.dart';

class OngoingList extends StatelessWidget {
  final double width;
  final double height;

  const OngoingList({
    Key key,
    this.width: 80,
    this.height: 100,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: ClassesStoryDataBase().testClassStream(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            height: height,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: snapshot.data.map<Widget>((session) {
                  return Ongoing(
                    image: session.image,
                    name: session.subject.name,
                    width: width,
                  );
                }).toList(),
              ),
            ),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
