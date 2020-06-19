import 'package:flutter/material.dart';
import 'package:malta/app/home/providers/school_model.dart';
import 'package:provider/provider.dart';
import 'package:malta/app/home/widgets/school_list.dart';

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
