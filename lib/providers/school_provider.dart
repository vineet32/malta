import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:malta/data/models/school.dart';
import 'package:malta/data/repositories/school/contract_provider_school.dart';
import 'package:malta/data/repositories/user/contract_provider_user.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class SchoolProvider extends ChangeNotifier {
  final SchoolProviderContract schoolProviderContract;
  final UserProviderContract userProviderContract;
  SchoolProvider({this.schoolProviderContract, this.userProviderContract}) : 
  assert(userProviderContract != null),
  assert(schoolProviderContract != null);

  final List<School> schools = [];
  final List userSchools = [];

  UnmodifiableListView<School> get getSchools => UnmodifiableListView(schools);

  getAllSchools() async {
    await userProviderContract.allUsers().then((value) {
      if(value.success && value.results != null){
         value.results[0]['schools'].forEach((element) async {
           userSchools.add(element);
         });
      }
    });
    userSchools.forEach((element) async {
      QueryBuilder<ParseObject> queryData = QueryBuilder<ParseObject>(ParseObject('School'));
      queryData.whereEqualTo('objectId', element.toString());
      queryData.query().then((value) {
        schools.add(value.results[0]);
      }
      
      );
      // await schoolProviderContract.getById(element.toString()).then((value) { 
      // if(value.success && value.results != null){
      //   int length = value.results.length;
      //   for(int i = 0; i < length; i++){
      //     schools.add(value.results[i]);}
      //   }
      // });
    });
    return schools;
    }
}