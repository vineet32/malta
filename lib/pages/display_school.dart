import 'package:flutter/material.dart';
import 'package:malta/data/base/api_response.dart';
import 'package:malta/data/repositories/school/school_contract.dart';
import 'package:malta/widgets/school/school_list.dart';
import 'package:provider/provider.dart';

class DisplaySchool extends StatelessWidget {
  
  // final List schools;
  // DisplaySchool({this.schools});

  @override
  Widget build(BuildContext context) {
      final provider = Provider.of<SchoolContract>(context);
      return Scaffold(
        appBar: AppBar(title: Text('Choose your School'),key: Key('appBar'),),
        body: FutureBuilder<ApiResponse>(
          key: Key('schoolList'),
          future: provider.getAll(),
          builder: (context, AsyncSnapshot<ApiResponse> snapshot){
            if(snapshot.hasData){
               //SchoolList(schools: schools)
               return SchoolList(schools: snapshot.data.results);
            }
            else{
              return Center(child:Text('Conecting.....',key: Key('text'),));
            }
          }
        )
      );
    
  }
}