import 'package:flutter/material.dart';
import 'package:malta/data/base/api_response.dart';
import 'package:malta/data/repositories/user/user_contract.dart';
import 'package:provider/provider.dart';
class TeacherList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userContract =
        Provider.of<UserContract>(context, listen: false);

    return Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.5,
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              //     child: FutureBuilder<ApiResponse>(
              // key: Key('sectionList'),
              // future: sectionContract.getBySchoolId(currentSchool),
              // builder: (context, AsyncSnapshot<ApiResponse> snapshot) {
              //   if (snapshot.hasData && snapshot.data.results != null) {
              //     return GridView.builder(
              //       itemCount: snapshot.data.results.length,
              //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //             crossAxisCount: 3),
              //         itemBuilder: (BuildContext context, int index) {
              //           final Section section = snapshot.data.results[index];
              //           return InkWell(
              //             child: Column(
              //               mainAxisAlignment: MainAxisAlignment.center,
              //               children: [
              //                 CircleAvatar(
              //                   radius: 40,
              //                   backgroundColor: Colors.blue[50],
              //                 ),
              //                 Text(section.name),
              //               ],
              //             ),
              //             onTap: () {
              //               Navigator.push(
              //                   context,
              //                   MaterialPageRoute(
              //                       builder: (context) =>
              //                           StudentsInSection(section: section)));
              //             },
              //           );
              //         });
              //   } else {
              //     return Center(
              //         child: Text(
              //       'No Sections found.....',
              //       key: Key('text'),
              //     ));
              //   }
              // }),
                )
              );
  }
}