import 'package:flutter/material.dart';
import 'package:malta/data/repositories/school/api_school.dart';
import 'package:malta/data/repositories/user/api_user.dart';
import 'package:malta/providers/school_provider.dart';
import 'package:provider/provider.dart';

class DisplaySchool extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
          return ChangeNotifierProvider<SchoolProvider>(
            create: (context) => SchoolProvider(schoolContract: SchoolApi()),
            child: Builder(builder: (context){
              return Scaffold(
                floatingActionButton: FloatingActionButton(onPressed: (){
                  SchoolProvider(schoolContract: SchoolApi(),userContract: UserApi())
                  .getUserSchools('principal');
                }),
           ); 
           
            }),
          );  
    }
}
