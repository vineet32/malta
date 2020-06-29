import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:malta/data/base/api_response.dart';
import 'package:malta/data/models/school.dart';
import 'package:malta/data/repositories/class/class_contract.dart';
import 'package:malta/data/repositories/subject/subject_contract.dart';
import 'package:malta/widgets/class/ongoing_list.dart';
import 'package:malta/widgets/class/start_class_list.dart';
import 'package:provider/provider.dart';

class CurrentClass extends StatelessWidget {
  const CurrentClass({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _classApi = Provider.of<ClassContract>(context);
    final _subjectApi = Provider.of<SubjectContract>(context);
    final _school = Provider.of<School>(context);

    return Container(
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
              future: _classApi.getActive(_school),
              builder:
                  (BuildContext context, AsyncSnapshot<ApiResponse> snapshot) {
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
                future: _subjectApi.getBySchoolId(_school),
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
    );
  }
}
