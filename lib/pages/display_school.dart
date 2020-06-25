import 'package:flutter/material.dart';
import 'package:malta/data/base/api_response.dart';
import 'package:malta/widgets/school/school_list.dart';
import 'package:malta/providers/school_provider.dart';
import 'package:provider/provider.dart';

class DisplaySchool extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SchoolProvider>(builder: (context, provider, child){
      return Scaffold(
        appBar: AppBar(title: Text('Choose your School')),
        body: FutureBuilder<ApiResponse>(
          future: provider.getAllSchools(),
          builder: (context, AsyncSnapshot<ApiResponse> snapshot){
            if(snapshot.hasData){
              return SchoolList(schools: snapshot.data.results);
            }
            else{
              return Text('Conecting.....');
            }
          }
        )
      );
    });
  }
}
