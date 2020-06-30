import 'package:malta/data/models/school.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class Section extends ParseObject implements ParseCloneable {
  Section() : super(_keyTableName);
  Section.clone() : this();

  @override
  Section fromJson(Map<String, dynamic> objectData) {
    super.fromJson(objectData);
    if (objectData.containsKey(keySchool)) {
      school = School.clone().fromJson(objectData[keySchool]);
    }
    return this;
  }

  static const String _keyTableName = 'Section';
  static const String keyName = 'name';
  static const String keyImage = 'image';
  static const String keySchool = "school";

  @override
  Section clone(Map<String, dynamic> map) => Section.clone()..fromJson(map);

  String get name => get<String>(keyName);
  set name(String name) => set<String>(keyName, name);

  String get image => get<String>(keyImage);
  set image(String image) => set<String>(keyImage, image);

  School get school => get<School>(keySchool);
  set school(School school) => set<School>(keySchool, school);
}
