import 'package:parse_server_sdk/parse_server_sdk.dart';

const String _keyTableName = 'Subject';
const String keyName = 'name';
const String keyImage = 'image';
const String keySchool = "school";


class Subject extends ParseObject implements ParseCloneable {
  Subject() : super(_keyTableName);
  Subject.clone() : this();

  @override
  clone(Map map) => Subject.clone()..fromJson(map);

  String get name => get<String>(keyName);
  set name(String name) => set<String>(keyName, name);

  String get image => get<String>(keyImage);
  set image(String image) => set<String>(keyImage, image);

  ParseObject get school => get<ParseObject>(keySchool);
  set school(ParseUser school) => set<ParseUser>(keySchool, school);

}
