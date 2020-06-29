import 'package:flutter/material.dart';
import 'package:malta/data/base/api_response.dart';
import 'package:malta/data/models/school.dart';
import 'package:malta/data/repositories/section/section_contract.dart';
import 'package:malta/providers/school_provider.dart';
import 'package:malta/widgets/section/section_card_list.dart';
import 'package:provider/provider.dart';
import 'package:malta/widgets/section/add_section.dart';

class Administer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sectionContract =
        Provider.of<SectionContract>(context, listen: false);
    final schoolProvider = Provider.of<SchoolProvider>(context, listen: false);
    School currentSchool = schoolProvider.getCurrentlySelectedSchool;
    return Scaffold(
        appBar: AppBar(
          title: Text(currentSchool.name),
          actions: [
            InkWell(
              child: CircleAvatar(child: Icon(Icons.add)),
              onTap: () async {
                showDialog(
                    context: context,
                    builder: (_) {
                      return AddSection();
                    });
              },
            )
          ],
        ),
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: FutureBuilder<ApiResponse>(
                key: Key('sectionList'),
                future: sectionContract.getBySchoolId(currentSchool.objectId),
                builder: (context, AsyncSnapshot<ApiResponse> snapshot) {
                  if (snapshot.hasData && snapshot.data.result != null) {
                    return SectionCardList(sections: snapshot.data.results);
                  } else {
                    return Center(
                        child: Text(
                      'No Sections found.....',
                      key: Key('text'),
                    ));
                  }
                })));
  }
}
