import 'package:flutter/material.dart';
import 'package:malta/data/base/api_response.dart';
import 'package:malta/data/repositories/subject/subject_contract.dart';
import 'package:malta/providers/school_provider.dart';
import 'package:malta/widgets/admin_tab/add_subject.dart';
import 'package:malta/widgets/admin_tab/subjects_list.dart';
import 'package:provider/provider.dart';

class DisplaySubjects extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _subjectApi = Provider.of<SubjectContract>(context);
    final _school = Provider.of<SchoolProvider>(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          return showDialog<void>(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return AddSubject();
            },
          );
        },
      ),
      body: FutureBuilder<ApiResponse>(
          future: _subjectApi.getBySchoolId(_school.getCurrentlySelectedSchool),
          builder: (BuildContext context, AsyncSnapshot<ApiResponse> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.results != null) {
                return SubjectsList(
                  subjectsList: snapshot.data.results,
                );
              } else {
                return Text("No Subjects");
              }
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
