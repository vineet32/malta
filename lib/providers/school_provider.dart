import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:malta/data/repositories/school/contract_school.dart';
import 'package:malta/data/repositories/user/contract_user.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class SchoolProvider extends ChangeNotifier {
  final SchoolContract schoolContract;
  final UserContract userContract;
  SchoolProvider({this.schoolContract, this.userContract}) : assert(schoolContract != null, userContract != null);

  getSchoolById(String schoolId) async {
    return schoolContract.getById(schoolId);
  }

  getAllSchools() {
    return schoolContract.getAll();
  }

  getSchoolByName(String schoolName) async {
    QueryBuilder<ParseObject> querySchool = QueryBuilder<ParseObject>(ParseObject('School'));
    querySchool.whereEqualTo('name', schoolName);
    querySchool.query().then((value) => value.results);//return a School object
  }

  getUserSchools(String userId) async {
    QueryBuilder<ParseObject> queryUser = QueryBuilder<ParseObject>(ParseObject('User'));
    queryUser.whereEqualTo('username', userId);
    queryUser.query().then((value) => print(value.results));
    //code implementation pending.....
  }

  addSchool() {}//add a school 
  addSchools() {}//adds list of schools

}