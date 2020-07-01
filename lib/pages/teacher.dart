import 'package:flutter/material.dart';
import 'package:malta/data/base/api_response.dart';
import 'package:malta/data/repositories/user/user_contract.dart';
import 'package:malta/widgets/teacher/teacher_list.dart';
class Teacher extends StatelessWidget {
  final UserContract userContract;
  Teacher({this.userContract});

  @override
  Widget build(BuildContext context) {
    return Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.5,
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: FutureBuilder<ApiResponse>(
                  key: Key('teacherList'),
                  future: userContract.allUsers(),
                  builder: (context, AsyncSnapshot<ApiResponse> snapshot) {
                    if (snapshot.hasData && snapshot.data.result != null) {
                      return TeacherList(teachers: snapshot.data.results);
                    } else {
                      return Center(
                          child: Text(
                        'No Teachers found.....',
                        key: Key('text'),
                      ));
                    }
                  }),
                )
              );
  }
}