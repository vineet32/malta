import 'package:parse_server_sdk/parse_server_sdk.dart';

class Section extends ParseObject implements ParseCloneable {
  Section() : super(_keyTableName);
  Section.clone() : this();

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

  ParseObject get school => get<ParseObject>(keySchool);
  set school(ParseUser school) => set<ParseUser>(keySchool, school);
}