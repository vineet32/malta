import 'package:malta/data/models/school.dart';
import 'package:malta/data/models/section.dart';
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

  Section get section => get<Section>(keySection);
  set section(Section section) => set<Section>(keySection, section);

  School get school => get<School>(keySchool);
  set school(School school) => set<School>(keySchool, school);

  num get age => get<num>(keyAge);
  set age(num age) => set<num>(keyAge, age);

  ParseFile get image => get<ParseFile>(keyImage);
  set image(ParseFile image) => set<ParseFile>(keyImage, image);

  String get gender => get<String>(keyGender);
  set gender(String image) => set<String>(keyGender, image);


}