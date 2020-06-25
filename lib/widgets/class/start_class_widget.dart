import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:malta/data/base/api_response.dart';
import 'package:malta/data/models/class.dart';
import 'package:malta/data/models/subject.dart';
import 'package:malta/data/repositories/class/api_class.dart';
import 'package:provider/provider.dart';

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
    final _apiClass = Provider.of<ApiClass>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FlatButton(
        onPressed: () async {
          ApiResponse response = await _apiClass.add(
            Class()
              ..set(Class.keySections, [])
              ..set(Class.keyActive, true)
              ..set(Class.keySubject, subject),
          );
          print("in response ${response.results}");
        },
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
