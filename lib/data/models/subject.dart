import 'package:parse_server_sdk/parse_server_sdk.dart';

class Subject extends ParseObject implements ParseCloneable {
  Subject() : super(_keyTableName);
  Subject.clone() : this();

 static const String _keyTableName = 'Subject';
 static const String keyName = 'name';
 static const String keyImage = 'image';
 static const String keySchool = "school";
  @override
  clone(Map map) => Subject.clone()..fromJson(map);

  String get name => get<String>(keyName);
  set name(String name) => set<String>(keyName, name);

  String get image => get<String>(keyImage);
  set image(String image) => set<String>(keyImage, image);

  ParseObject get school => get<ParseObject>(keySchool);
  set school(ParseUser school) => set<ParseUser>(keySchool, school);

  Future<ParseResponse> getBySchoolId(String schoolId) async {
    QueryBuilder<Subject> queryBuilder = QueryBuilder<Subject>(Subject())
      ..whereMatchesQuery(
          keySchool,
          QueryBuilder(ParseObject("School"))
            ..whereEqualTo("objectId", schoolId));
    return await queryBuilder.query();
  }
}
