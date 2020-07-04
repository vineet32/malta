import 'package:flutter/material.dart';
import 'package:malta/data/models/school.dart';
import 'package:malta/pages/home_page.dart';
import 'package:malta/providers/school_provider.dart';
import 'package:provider/provider.dart';

class DisplaySchoolWidget extends StatelessWidget {
  final School school;
  DisplaySchoolWidget({this.school});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.blue[50],
          backgroundImage: NetworkImage(school.image != null?
            school.image.url:'https://webstockreview.net/images/school-clipart-5.jpg'),
        ),
        Text(school.name)
      ]),
      onTap: () {
        final schoolProvider =
            Provider.of<SchoolProvider>(context, listen: false);
        schoolProvider.setCurrentlySelectedSchool(school);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      },
    );
  }
}
