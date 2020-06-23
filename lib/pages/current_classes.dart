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
  final String schoolId;
  const CurrentClasses(
    this._classesProvider,
    this._subjectProvider,
    this.schoolId, {
    Key key,
  })  : assert(schoolId != null),
        assert(_classesProvider != null),
        assert(_subjectProvider != null),
        super(key: key); 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Current Sessions"),
      ),
      body: Container(
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
                future: _classesProvider.getActive(schoolId),
                builder: (BuildContext context,
                    AsyncSnapshot<ApiResponse> snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data.results != null) {
                      return OngoingList(
                        ongoingList: snapshot.data.results,
                      );
                    } else {
                      return Text("No Ongoing Classes");
                    }
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
                  future: _subjectProvider.getBySchoolId(schoolId),
                  builder: (BuildContext context,
                      AsyncSnapshot<ApiResponse> snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data.results != null) {
                        return StartClassList(
                          startClassList: snapshot.data.results,
                        );
                      } else {
                        return Text("No Subjects to Start");
                      }
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
