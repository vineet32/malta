import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:malta/data/repositories/subject/subject_provider_api.dart';
import 'package:malta/widgets/classes/ongoing_list.dart';
import 'package:malta/widgets/classes/start_class_list.dart';

class CurrentClasses extends StatelessWidget {
  const CurrentClasses({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("Current Sessions"),
      ),
      body: Container(
        width: width,
        height: height,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 10),
              alignment: Alignment.topLeft,
              child: Text(
                "Ongoing Classes",
                style: TextStyle(fontSize: 30),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            OngoingList(
              height: height * .20,
              width: height * .17,
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                "Start a new Class",
                style: TextStyle(fontSize: 30),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: StartClassList(),
            ),
          ],
        ),
      ),
    );
  }
}
