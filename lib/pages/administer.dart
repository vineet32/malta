import 'package:flutter/material.dart';
import 'package:malta/data/models/school.dart';
import 'package:malta/data/repositories/section/section_contract.dart';
import 'package:malta/data/repositories/user/user_contract.dart';
import 'package:malta/pages/section.dart';
import 'package:malta/pages/teacher.dart';
import 'package:malta/providers/school_provider.dart';
import 'package:provider/provider.dart';
import 'package:malta/widgets/section/add_section.dart';

class Administer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sectionContract =
        Provider.of<SectionContract>(context, listen: false);
    // final userContract =
    //     Provider.of<UserContract>(context, listen: false);

    final schoolProvider = Provider.of<SchoolProvider>(context);
    School currentSchool = School();
    currentSchool = schoolProvider.getCurrentlySelectedSchool;
    
    return Scaffold(
        appBar: AppBar(
          title: Text('Administer tab'),
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
          color: Colors.blue,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(children: [
              Section(sectionContract: sectionContract,currentSchool: currentSchool,),
              Padding(padding: EdgeInsets.only(bottom: 10.0)),
              //Teacher(userContract: userContract,)
            ],),
    
       ));
       
  }
}
