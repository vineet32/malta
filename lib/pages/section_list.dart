import 'package:flutter/material.dart';
import 'package:malta/data/base/api_response.dart';
import 'package:malta/data/models/school.dart';
import 'package:malta/data/models/section.dart';
import 'package:malta/data/repositories/section/section_contract.dart';
import 'package:malta/pages/students_in_section.dart';
import 'package:malta/providers/school_provider.dart';
import 'package:malta/widgets/section/add_section.dart';
import 'package:provider/provider.dart';

class SectionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sectionContract =
        Provider.of<SectionContract>(context, listen: false);
    final schoolProvider = Provider.of<SchoolProvider>(context);
    School currentSchool = School();
    currentSchool = schoolProvider.getCurrentlySelectedSchool;
    return Scaffold(
          body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: FutureBuilder<ApiResponse>(
                key: Key('sectionList'),
                future: sectionContract.getBySchool(currentSchool),
                builder: (context, AsyncSnapshot<ApiResponse> snapshot) {
                  if (snapshot.hasData && snapshot.data.results != null) {
                    return SingleChildScrollView(
                      child: Wrap(
                        runSpacing: 20,
                        spacing: 20,
                        children: snapshot.data.results.map((e){
                          Section section = e;
                           return InkWell(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 40,
                                  backgroundColor: Colors.blue[50],
                                  backgroundImage: NetworkImage(section.image != null?section.image.url:
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSz-9LnJRG68QfsPgJoA8UzO-Qiwl-FqvB6iQ&usqp=CAU'),
                                ),
                                Text(section.name),
                              ],
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          StudentsInSection(section: section)));
                            },
                          );
                        }).toList(),
                          //final Section section = snapshot.data.results[index];
                         
                      ));
                  } else {
                    return Center(
                        child: Text(
                      'No Sections found.....',
                      key: Key('text'),
                    ));
                  }
                }),
          )),
          floatingActionButton: FloatingActionButton(onPressed: () async {
                showDialog(
                    context: context,
                    builder: (_) {
                      return AddSection();
                    });
              },
          child: Icon(Icons.add),),
    );
  }
}
