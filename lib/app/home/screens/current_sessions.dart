import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:malta/app/home/models/session.dart';
import 'package:malta/app/home/models/subject.dart';
import 'package:malta/app/home/widgets/current_sessions/ongoing_list.dart';
import 'package:malta/app/home/widgets/current_sessions/start_class_list.dart';

class CurrentSessions extends StatelessWidget {
  final List<Session> session;
  final List<Subject> subjects;

  const CurrentSessions({
    Key key,
    @required this.session,
    @required this.subjects,
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
              session: session,
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
              child: StartClassList(subjects: subjects),
            ),
          ],
        ),
      ),
    );
  }
}
