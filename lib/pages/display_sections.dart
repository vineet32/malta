import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:malta/data/base/api_response.dart';
import 'package:malta/data/models/subject.dart';
import 'package:malta/data/repositories/section/section_contract.dart';
import 'package:malta/providers/school_provider.dart';
import 'package:malta/widgets/section/section_list.dart';
import 'package:provider/provider.dart';

class DisplaySections extends StatelessWidget {
  final Subject subject;

  const DisplaySections({
    Key key,
    this.subject,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final school = Provider.of<SchoolProvider>(context, listen: false);
    final _sectionApi = Provider.of<SectionContract>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(subject.name),
      ),
      body: FutureBuilder<ApiResponse>(
          future: _sectionApi.getBySchool(school.getCurrentlySelectedSchool),
          builder: (BuildContext context, AsyncSnapshot<ApiResponse> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.results != null) {
                return SectionList(
                  sections: snapshot.data.results,
                  subject: subject,
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
