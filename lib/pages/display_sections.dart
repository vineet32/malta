import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:malta/data/base/api_response.dart';
import 'package:malta/data/models/class.dart';
import 'package:malta/data/models/school.dart';
import 'package:malta/data/models/subject.dart';
import 'package:malta/data/models/user.dart';
import 'package:malta/data/repositories/class/class_contract.dart';
import 'package:malta/data/repositories/section/section_contract.dart';
import 'package:malta/widgets/section/section_list.dart';
import 'package:provider/provider.dart';

class DisplaySections extends StatelessWidget {
  final Subject subject;
  final School school;
  final User teacher;

  const DisplaySections({
    Key key,
    this.subject,
    this.school,
    this.teacher,
  })  : assert(teacher != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    List selectedSections = [];
    final _classApi = Provider.of<ClassContract>(context);
    final _sectionApi = Provider.of<SectionContract>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(subject.name),
        actions: [
          IconButton(
            icon: Icon(Icons.done),
            onPressed: () async {
              if (selectedSections.isNotEmpty) {
                ApiResponse response = await _classApi.add(
                  Class()
                    ..set(Class.keySections, selectedSections)
                    ..set(Class.keyActive, true)
                    ..set(Class.keySubject, subject)
                    ..set(Class.keySchool, school)
                    ..set(Class.keyTeacher, teacher),
                );
                print("Response ${response.results}");
              }
            },
          )
        ],
      ),
      body: FutureBuilder<ApiResponse>(
          future: _sectionApi.getBySchoolId(school),
          builder: (BuildContext context, AsyncSnapshot<ApiResponse> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.results != null) {
                return SectionList(
                  sections: snapshot.data.results,
                  onSelect: (sections) {
                    selectedSections = sections;
                  },
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
    );
  }
}
