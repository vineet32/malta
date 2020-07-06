import 'package:malta/data/models/school.dart';
import 'package:malta/data/models/student.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

import 'class.dart';

class Monitor extends ParseObject implements ParseCloneable {
  Monitor() : super(_keyTableName);
  Monitor.clone() : this();

  static const String _keyTableName = 'Monitor';
  static const String keyLevel = 'level';
  static const String keyIncorrect = 'incorrect';
  static const String keyTotalQuestions = "totalQuestions";
  static const String keyCorrect = "correct";
  static const String keyActivity = "activity";
  static const String keyTotalChallenges = "totalChallenges";
  static const String keySchool = 'school';
  static const String keyClass = 'class';
  static const String keyStudent = "student";
  static const String keyTotalSeconds = "totalSeconds";

  @override
  Monitor clone(Map<String, dynamic> map) =>
      Monitor.clone()..fromJson(map);

  Class get currentClass => get<Class>(keyClass);
  set currentClass(Class currentClass) => set<Class>(keyClass, currentClass);

  School get school => get<School>(keySchool);
  set school(School school) => set<School>(keySchool, school);

  Student get student => get<Student>(keyStudent);
  set student(Student student) => set<Student>(keyStudent, student);
}