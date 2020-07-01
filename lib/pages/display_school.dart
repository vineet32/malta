import 'package:flutter/material.dart';
import 'package:malta/data/base/api_response.dart';
import 'package:malta/data/models/school.dart';
import 'package:malta/data/models/user.dart';
import 'package:malta/data/repositories/school/school_contract.dart';
import 'package:malta/pages/administer.dart';
import 'package:malta/pages/current_class.dart';
import 'package:malta/pages/home_page.dart';
import 'package:malta/providers/school_provider.dart';
import 'package:malta/widgets/school/school_list.dart';
import 'package:provider/provider.dart';


class DisplaySchool extends StatelessWidget {

  Widget _buildChild(context) {
    final schoolContract = Provider.of<SchoolContract>(context);
    final userProvider = Provider.of<User>(context, listen: false);
    User user = userProvider;

    if(user != null){
      if(user.schools.length != null){
      if(user.schools.length == 1){
        final schoolProvider = Provider.of<SchoolProvider>(context, listen: false);
        School school = School();
        return FutureBuilder<ApiResponse>(
          future: schoolContract.getById(user.schools[0].toString()),
          builder: (context, AsyncSnapshot<ApiResponse> snapshot){
            if(snapshot.hasData){
              school = snapshot.data.results[0];
              schoolProvider.setCurrentlySelectedSchool(school);
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
            }
          }
        );
      }
      else{
        return FutureBuilder<ApiResponse>(
          key: Key('schoolList'),
          future: schoolContract.getById(user.schools[1]),
          builder: (context, AsyncSnapshot<ApiResponse> snapshot){           
            if(snapshot.hasData){
               return SchoolList(schools: snapshot.data.results);
            }
            else{
              return Center(child:Text('Conecting.....',key: Key('text'),));
            }
          }
        );  
    }
    }}
    return Container();
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: Text('Choose your School'),key: Key('appBar'),),
        body:  _buildChild(context)
      );
   }  
}