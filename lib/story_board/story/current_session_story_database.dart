import 'package:flutter/material.dart';
import 'package:malta/app/home/models/class.dart';
import 'package:malta/app/home/models/subject.dart';

class ClassStoryDataBase extends ChangeNotifier {
  //test data
  final List<Subject> _subjects = [];
  final List<Class> _sesssions = [];

  //test stream
  Stream<List<Class>> testClassStream() async* {
    List<Class> tesClass = [];
    for (int i = 0; i < _sesssions.length; i++) {
      await Future.delayed(Duration(seconds: 2));
      tesClass.add(_sesssions[i]);
      yield tesClass;
    }
  }

  Stream<List<Subject>> testSubjectStream() async* {
    List<Subject> tesSubjects = [];
    for (int i = 0; i < _sesssions.length; i++) {
      await Future.delayed(Duration(seconds: 1));
      tesSubjects.add(_subjects[i]);
      yield tesSubjects;
    }
  }
}
