import 'package:malta/data/models/school.dart';
import 'package:malta/data/models/section.dart';
import 'package:malta/data/models/subject.dart';
import 'package:malta/data/models/user.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class Class extends ParseObject implements ParseCloneable {
  Class() : super(_keyTableName);
  Class.clone() : this();

  static const String _keyTableName = 'Class';
  static const String keyTeacher = 'teacher';
  static const String keySections = 'sections';
  static const String keySchool = "school";
  static const String keySubject = "subject";
  static const String keyActive = "active";

  @override
  Class clone(Map<String, dynamic> map) => Class.clone()..fromJson(map);

  @override
  Class fromJson(Map<String, dynamic> objectData) {
    super.fromJson(objectData);
    if (objectData.containsKey(keySubject)) {
      subject = Subject.clone().fromJson(objectData[keySubject]);
    }
    if (objectData.containsKey(keySchool)) {
      school = School.clone().fromJson(objectData[keySchool]);
    }
    if (objectData.containsKey(keyTeacher)) {
      teacher = User.clone().fromJson(objectData[keyTeacher]);
    }
    if (objectData.containsKey(keySections)) {
      for (int i = 0; i < objectData[keySections].length; i++) {
        sections[i] = Section.clone().fromJson(objectData[keySections][i]);
      }
    }
    return this;
  }

  User get teacher => get<User>(keyTeacher);
  set teacher(User teacher) => set<User>(keyTeacher, teacher);

  List get sections => get<List>(keySections);
  set sections(List sections) => set<List>(keySections, sections);

  School get school => get<School>(keySchool);
  set school(School school) => set<School>(keySchool, school);

  Subject get subject => get<Subject>(keySubject);
  set subject(Subject subject) => set<Subject>(keySubject, subject);

  bool get active => get<bool>(keySections);
  set active(bool active) => set<bool>(keySections, active);
}
