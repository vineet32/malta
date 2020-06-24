import 'package:malta/data/models/subject.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class Classes extends ParseObject implements ParseCloneable {
  Classes() : super(_keyTableName);
  Classes.clone() : this();

  static const String _keyTableName = 'Class';
  static const String keyTeacher = 'teacher';
  static const String keySections = 'sections';
  static const String keySchool = "school";
  static const String keySubject = "subject";
  static const String keyActive = "active";

  @override
  Classes clone(Map<String, dynamic> map) => Classes.clone()..fromJson(map);

  @override
  Classes fromJson(Map<String, dynamic> objectData) {
    super.fromJson(objectData);
    if (objectData.containsKey(keySubject)) {
      subject = Subject.clone().fromJson(objectData[keySubject]);
    }
    return this;
  }

  ParseObject get teacher => get<ParseObject>(keyTeacher);
  set teacher(ParseObject teacher) => set<ParseObject>(keyTeacher, teacher);

  List get sections => get<List>(keySections);
  set sections(List sections) => set<List>(keySections, sections);

  ParseObject get school => get<ParseObject>(keySchool);
  set school(ParseObject school) => set<ParseObject>(keySchool, school);

  Subject get subject => get<Subject>(keySubject);
  set subject(Subject subject) => set<Subject>(keySubject, subject);

  bool get active => get<bool>(keySections);
  set active(bool active) => set<bool>(keySections, active);
}
