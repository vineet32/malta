import 'package:flutter/material.dart';
import 'package:malta/data/repositories/school/provider_api_school.dart';
import 'package:malta/data/repositories/user/provider_api_user.dart';
import 'package:malta/providers/school_provider.dart';
import 'package:provider/provider.dart';
import 'package:malta/data/models/school.dart';
import 'package:malta/widgets/school/school_list.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:malta/domain/constants/application_constants.dart';
import 'package:malta/providers/inherited_data_provider.dart';

class DisplaySchool extends StatefulWidget {
  _DisplaySchoolState createState() => _DisplaySchoolState();
}

class _DisplaySchoolState extends State<DisplaySchool>{
  Future initParse() async {
  await Parse().initialize(keyParseApplicationId, keyParseServerUrl,
        masterKey: keyParseMasterKey,
        debug: true);
  }

  List<School> schools;

  Future loadData() async {
    await SchoolProvider(schoolProviderContract: SchoolProviderApi(),userProviderContract: UserProviderApi()).getAllSchools().then(
      (list){
        setState((){
          schools = list;
        });
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    initParse();
          return ChangeNotifierProvider<SchoolProvider>(
            create: (context) => SchoolProvider(schoolProviderContract: SchoolProviderApi()),
            child: Builder(builder: (context){
              return Scaffold(
              floatingActionButton: FloatingActionButton(
                child: Icon(Icons.verified_user),
                onPressed: ()async {
                  await loadData();
                  Navigator.push(context,MaterialPageRoute(
                      builder: (context) => InheritedDataProvider(
                        child: SchoolList(schools: schools),
                      )),
                );
            }),
           ); 
           
            }),
          );  
    }
}
