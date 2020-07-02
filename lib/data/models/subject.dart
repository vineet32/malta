import 'package:malta/data/models/school.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class Subject extends ParseObject implements ParseCloneable {
  Subject() : super(_keyTableName);
  Subject.clone() : this();

  @override
  Subject fromJson(Map<String, dynamic> objectData) {
    super.fromJson(objectData);
    if (objectData.containsKey(keySchool)) {
      school = School.clone().fromJson(objectData[keySchool]);
    }
    return this;
  }

  static const String _keyTableName = 'Subject';
  static const String keyName = 'name';
  static const String keyImage = 'image';
  static const String keySchool = "school";

  @override
  Subject clone(Map<String, dynamic> map) => Subject.clone()..fromJson(map);

  String get name => get<String>(keyName);
  set name(String name) => set<String>(keyName, name);

  ParseFile get image => get<ParseFile>(keyImage);
  set image(ParseFile image) => set<ParseFile>(keyImage, image);

  School get school => get<School>(keySchool);
  set school(School school) => set<School>(keySchool, school);
}
