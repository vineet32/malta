import 'package:flutter/material.dart';
import 'package:malta/data/models/school_model.dart';
import 'package:malta/widgets/school/school_list.dart';
import 'package:provider/provider.dart';

class DisplaySchool extends StatefulWidget {
  @override
  _DisplaySchoolState createState() => _DisplaySchoolState();
}

class _DisplaySchoolState extends State<DisplaySchool> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SchoolModel>(
        create: (context) => SchoolModel(),
        child: Builder(builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Choose your school'),
            ),
            body: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child:
                    Consumer<SchoolModel>(builder: (context, provider, child) {
                  return SchoolList(schools: provider.getAllSchools);
                })),
          );
        }));
  }
}
