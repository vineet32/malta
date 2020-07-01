import 'package:flutter/material.dart';
import 'package:malta/data/base/api_response.dart';
import 'package:malta/data/models/school.dart';
import 'package:malta/data/repositories/section/section_contract.dart';
import 'package:malta/widgets/section/section_card_list.dart';
class Section extends StatelessWidget {
  final SectionContract sectionContract;
  final School currentSchool;
  Section({this.sectionContract, this.currentSchool});

  @override
  Widget build(BuildContext context) {
    return Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.5,
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: FutureBuilder<ApiResponse>(
                  key: Key('sectionList'),
                  future: sectionContract.getBySchoolId(currentSchool),
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
                  }),
                )
              );
  }
}