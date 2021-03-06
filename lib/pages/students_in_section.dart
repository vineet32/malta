import 'package:flutter/material.dart';
import 'package:malta/data/base/api_response.dart';
import 'package:malta/data/models/section.dart';
import 'package:malta/data/models/student.dart';
import 'package:malta/data/repositories/student/student_contract.dart';
import 'package:malta/pages/add_student.dart';
import 'package:malta/pages/edit_student.dart';
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
          ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        
        child: FutureBuilder<ApiResponse>(
              key: Key('sectionList'),
              future: studentContract.getBySection(section),
              builder: (context, AsyncSnapshot<ApiResponse> snapshot) {
                if (snapshot.hasData && snapshot.data.results != null) {
                  return SingleChildScrollView(
                      child: Wrap(
                        runSpacing: 20,
                        spacing: 20,
                        children: snapshot.data.results.map((e) {
                          Student student = e;
                          return InkWell(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 40,
                                backgroundColor: Colors.blue[50],
                                backgroundImage: NetworkImage(student.image != null?student.image.url:
                                  'https://webstockreview.net/images/kid-clipart-4.jpg'),
                              ),
                              Text(student.name),
                            ],
                          ),
                          onTap: () async {
                            showDialog(
                                context: context,
                                builder: (_) {
                                  return EditStudent(section: section,student: student);
                                });
                          },
                        );
                        }).toList()
                  ));    
                      
                } else {
                  return Center(
                      child: Text(
                    'No Students found.....',
                    key: Key('text'),
                  ));
                }
              }),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () async {
          showDialog(
                    context: context,
                    builder: (_) {
                      return AddStudent(section: section,);
                    });
        },
        child: Icon(Icons.add)),
    );
  }
}