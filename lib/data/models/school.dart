import 'package:parse_server_sdk/parse_server_sdk.dart';

const String keyTableName = 'School';
const String keyName = 'name';
const String keyImage = 'image';

class School extends ParseObject implements ParseCloneable {
  School() : super(keyTableName);
  School.clone() : this();

  @override
  School clone(Map<String, dynamic> map) => School.clone()..fromJson(map);

  String get name => get<String>(keyName);
  set name(String name) => set<String>(keyName, name);

  String get image => get<String>(keyImage);
  set image(String image) => set<String>(keyImage, image);
}
