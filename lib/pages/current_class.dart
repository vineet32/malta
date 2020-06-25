import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:malta/data/base/api_response.dart';
import 'package:malta/data/repositories/class/api_class.dart';
import 'package:malta/data/repositories/subject/api_subject.dart';
import 'package:malta/widgets/class/ongoing_list.dart';
import 'package:malta/widgets/class/start_class_list.dart';
import 'package:provider/provider.dart';

class CurrentClass extends StatelessWidget {
<<<<<<< Updated upstream
  final ContractClass _apiClass;
  final ContractSubject _apiSubject;
=======
<<<<<<< Updated upstream
  final ContractClass _classesProvider;
  final ContractSubject _subjectProvider;
>>>>>>> Stashed changes
  final String schoolId;
  const CurrentClass(
    this._apiClass,
    this._apiSubject,
    this.schoolId, {
    Key key,
  })  : assert(schoolId != null),
<<<<<<< Updated upstream
        assert(_apiClass != null),
        assert(_apiSubject != null),
=======
        assert(_classesProvider != null),
        assert(_subjectProvider != null),
=======
  final String schoolId;
  const CurrentClass(
    this.schoolId, {
    Key key,
  })  : assert(schoolId != null),
>>>>>>> Stashed changes
>>>>>>> Stashed changes
        super(key: key);
  @override
  Widget build(BuildContext context) {
    final _apiClass = Provider.of<ApiClass>(context);
    final _apiSubject = Provider.of<ApiSubject>(context);

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
                future: _apiClass.getActive(schoolId),
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
                  future: _apiSubject.getBySchoolId(schoolId),
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
