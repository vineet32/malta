import 'package:parse_server_sdk/parse_server_sdk.dart';

class School extends ParseObject implements ParseCloneable {
  School() : super(keyTableName);
  School.clone() : this();

  static const String keyTableName = 'School';
  static const String keyName = 'name';
  static const String keyImage = 'image';

  @override
  School clone(Map<String, dynamic> map) => School.clone()..fromJson(map);

  String get name => get<String>(keyName);
  set name(String name) => set<String>(keyName, name);

  ParseFile get image => get<ParseFile>(keyImage);
  set image(ParseFile image) => set<ParseFile>(keyImage, image);
}
