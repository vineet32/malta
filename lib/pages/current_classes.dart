import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:malta/data/base/api_response.dart';
import 'package:malta/data/repositories/classes/classes_provider.dart';
import 'package:malta/data/repositories/subject/subject_provider.dart';
import 'package:malta/widgets/classes/ongoing_list.dart';
import 'package:malta/widgets/classes/start_class_list.dart';

class CurrentClasses extends StatelessWidget {
  final ClassesProvider _classesProvider;
  final SubjectProvider _subjectProvider;
  const CurrentClasses(
    this._classesProvider,
    this._subjectProvider, {
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
            FutureBuilder<ApiResponse>(
                future: _classesProvider.getActive("EXWWaUQGmd"),
                builder: (BuildContext context,
                    AsyncSnapshot<ApiResponse> snapshot) {
                  if (snapshot.hasData) {
                    return OngoingList(
                      ongoingList: snapshot.data.results,
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
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
              child: FutureBuilder<ApiResponse>(
                  future: _subjectProvider.getBySchoolId("EXWWaUQGmd"),
                  builder: (BuildContext context,
                      AsyncSnapshot<ApiResponse> snapshot) {
                    if (snapshot.hasData) {
                      return StartClassList(
                        startClassList: snapshot.data.results,
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
