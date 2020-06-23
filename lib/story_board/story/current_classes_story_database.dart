import 'package:flutter/material.dart';
import 'package:malta/data/models/classes.dart';
import 'package:malta/data/models/subject.dart';

class ClassesStoryDataBase extends ChangeNotifier {
  //test data
  final List<Subject> _subjects = [];
  final List<Classes> _sesssions = [];

  //test stream
  Stream<List<Classes>> testClassStream() async* {
    List<Classes> tesClass = [];
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
