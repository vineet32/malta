import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:malta/data/base/api_response.dart';
import 'package:malta/data/models/class.dart';
import 'package:malta/data/models/subject.dart';
import 'package:malta/data/repositories/class/class_contract.dart';
import 'package:provider/provider.dart';

class StartClassWidget extends StatelessWidget {
  final String name;
  final Color color;

  const StartClassWidget({Key key, @required this.name, @required this.color})
      : assert(color != null),
        assert(name != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    final _apiClass = Provider.of<ClassContract>(context);

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
