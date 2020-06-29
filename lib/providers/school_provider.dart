import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:malta/data/models/school.dart';

class SchoolProvider extends ChangeNotifier {
  SchoolProvider();

  School school;

  void setCurrentlySelectedSchool(School currentSchool) {
    school = currentSchool;
    notifyListeners();
  }

  School get getSchool => school;

}