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
  clone(Map map) => Class.clone()..fromJson(map);

  ParseObject get teacher => get<ParseObject>(keyTeacher);
  set teacher(ParseObject teacher) => set<ParseObject>(keyTeacher, teacher);

  String get sections => get<String>(keySections);
  set sections(String sections) => set<String>(keySections, sections);

  ParseObject get school => get<ParseObject>(keySchool);
  set school(ParseUser school) => set<ParseUser>(keySchool, school);

  ParseObject get subject => get<ParseObject>(keySubject);
  set subject(ParseUser subject) => set<ParseUser>(keySubject, subject);

  bool get active => get<bool>(keySections);
  set active(bool active) => set<bool>(keySections, active);

  Future<ParseResponse> get getActive async {
    QueryBuilder<Class> queryBuilder = QueryBuilder<Class>(Class())
      ..whereEqualTo(keyActive, true);
    return await queryBuilder.query();
  }
}
