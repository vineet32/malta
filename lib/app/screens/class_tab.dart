import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:malta/models/session.dart';
import 'package:malta/models/subject.dart';
import 'package:random_color/random_color.dart';

class ClassTab extends StatelessWidget {
  final List<Session> session;
  final List<Subject> subjects;

  const ClassTab({
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
          Container(
            height: 400,
            child: ListView.builder(
              key: PageStorageKey<String>("jw"),
              itemCount: subjects.length,
              itemBuilder: (context, index) {
                RandomColor _randomColor = RandomColor();
                Color _color = _randomColor.randomColor(
                    colorBrightness: ColorBrightness.light);
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: _color,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      subjects[index].name,
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget showSession(Session session) {
    RandomColor _randomColor = RandomColor();
    Color _color =
        _randomColor.randomColor(colorBrightness: ColorBrightness.light);
    return Container(
      decoration: BoxDecoration(
        color: _color,
        borderRadius: BorderRadius.circular(40),
      ),
      width: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(session.subject.name),
          ClipOval(
            child: Image.network(
              session.image,
              width: 40,
              height: 40,
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
    );
  }
}
