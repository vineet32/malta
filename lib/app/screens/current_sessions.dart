import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:malta/models/session.dart';
import 'package:malta/models/subject.dart';
import 'package:random_color/random_color.dart';

class CurrentSessions extends StatelessWidget {
  final List<Session> session;
  final List<Subject> subjects;

  const CurrentSessions({
    Key key,
    this.session,
    this.subjects,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: Text("Ongoing"),
          ),
          SizedBox(
            height: 20,
          ),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: session.map((e) {
              return showSession(e);
            }).toList(),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            alignment: Alignment.topLeft,
            child: Text("Start"),
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            children: subjects.map((e) {
              RandomColor _randomColor = RandomColor();
              Color _color = _randomColor.randomColor(
                  colorBrightness: ColorBrightness.light);
              return FlatButton(
                onPressed: () {
                  print("button pressed");
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: _color,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      e.name,
                    ),
                  ),
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }

  Widget showSession(Session session) {
    RandomColor _randomColor = RandomColor();
    Color _color =
        _randomColor.randomColor(colorBrightness: ColorBrightness.light);
        double imageSize=50;
    return FlatButton(
      onPressed: () {
        print("pressed");
      },
      child: Container(
        decoration: BoxDecoration(
          color: _color,
          borderRadius: BorderRadius.circular(40),
        ),
        width: 130,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              session.subject.name,
            ),
            ClipOval(
              child: Image.network(
                session.image,
                width: imageSize,
                height: imageSize,
                fit: BoxFit.cover,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes
                          : null,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
