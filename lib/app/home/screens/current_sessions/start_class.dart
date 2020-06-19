import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StartClass extends StatelessWidget {
  final String name;
  final Color color;

  const StartClass({Key key, @required this.name, @required this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FlatButton(
        onPressed: () {
          print("pressed");
        },
        child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(40),
          ),
          alignment: Alignment.center,
          child: Text(
            name,
          ),
        ),
      ),
    );
  }
}
