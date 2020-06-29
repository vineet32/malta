import 'package:parse_server_sdk/parse_server_sdk.dart';

class Student extends ParseObject implements ParseCloneable {
  Student() : super(_keyTableName);
  Student.clone() : this();
  static const String _keyTableName = 'Student';
  static const String keyName = 'name';
  static const String keyGender = 'gender';
  static const String keySection = "section";
  static const String keySchool = "school";
  static const String keyImage = "image";
  static const String keyAge = "age";
  @override
  clone(Map map) => Student.clone()..fromJson(map);

  String get name => get<String>(keyName);
  set name(String name) => set<String>(keyName, name);

  String get section => get<String>(keySection);
  set section(String section) => set<String>(keySection, section);

  ParseObject get school => get<ParseObject>(keySchool);
  set school(ParseObject school) => set<ParseUser>(keySchool, school);

  num get age => get<num>(keyAge);
  set age(num age) => set<num>(keyAge, age);

  String get image => get<String>(keyImage);
  set image(String image) => set<String>(keyImage, image);

  String get gender => get<String>(keyGender);
  set gender(String image) => set<String>(keyGender, image);


}