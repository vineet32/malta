import 'package:flutter/material.dart';
import 'package:malta/data/base/api_response.dart';
import 'package:malta/data/models/section.dart';
import 'package:malta/data/repositories/student/student_contract.dart';
import 'package:malta/widgets/student/student_list.dart';
import 'package:provider/provider.dart';
import 'package:malta/widgets/section/edit_section.dart';

class StudentsInSection extends StatelessWidget {
  final Section section;
  StudentsInSection({this.section});
  @override
  Widget build(BuildContext context) {
    final studentContract = Provider.of<StudentContract>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: Text(section.name),
        actions: [
            InkWell(
              child: CircleAvatar(child: Icon(Icons.edit)),
              onTap: () async {
                showDialog(
                    context: context,
                    builder: (_) {
                      return EditSection(sectionId: section.objectId);
                    });
              },
            ),
            Padding(padding: EdgeInsets.only(right: 6.0)),
            InkWell(
              child: CircleAvatar(child: Icon(Icons.add)),
              onTap: () async {
                showDialog(
                    context: context,
                    builder: (_) {
                      
                    });
              },
            )
          ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        // child: FutureBuilder<ApiResponse>(
        //       key: Key('studentsList'),
        //       future: studentContract.getBySectionId(section),
        //       builder: (BuildContext context, AsyncSnapshot<ApiResponse> snapshot) {
        //         if (snapshot.hasData && snapshot.data.result != null) {
        //           return StudentList(students: snapshot.data.results);
        //         } else {
        //           return Center(
        //               child: Text(
        //             'No Students found.....',
        //             key: Key('text'),
        //           ));
        //         }
        //       }),
        )
    );
  }
}
