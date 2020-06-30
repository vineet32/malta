import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:malta/data/models/subject.dart';
import 'package:malta/pages/display_sections.dart';

class StartClassWidget extends StatelessWidget {
  final Color color;
  final Subject subject;

  const StartClassWidget({
    Key key,
    @required this.color,
    @required this.subject,
  })  : assert(color != null),
        assert(subject != null),
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
              ),
            ),
          );
        },
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(15),
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
