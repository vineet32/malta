import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:malta/data/models/subject.dart';

class StartClassWidget extends StatelessWidget {
  final Color color;
  final Subject subject;

  const StartClassWidget(
      {Key key, @required this.color, @required this.subject})
      : assert(color != null),
        assert(subject != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FlatButton(
        onPressed: () async {},
        child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(40),
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
