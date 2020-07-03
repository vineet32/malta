import 'package:malta/data/models/school.dart';
import 'package:malta/data/models/user.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class Connection extends ParseObject implements ParseCloneable {
  Connection() : super(_keyTableName);
  Connection.clone() : this();

  static const String _keyTableName = 'Connection';
  static const String keySchool = 'school';
  static const String keyUser = 'user';
  static const String keyRole = "role";
  @override
  Connection fromJson(Map<String, dynamic> objectData) {
    super.fromJson(objectData);
    if (objectData.containsKey(keySchool)) {
      school = School.clone().fromJson(objectData[keySchool]);
    }
    if (objectData.containsKey(keyUser)) {
      user = User.clone().fromJson(objectData[keyUser]);
    }
    return this;
  }

  @override
  Connection clone(Map<String, dynamic> map) =>
      Connection.clone()..fromJson(map);

  User get user => get<User>(keyUser);
  set user(User user) => set<User>(keyUser, user);

  School get school => get<School>(keySchool);
  set school(School school) => set<School>(keySchool, school);

  String get role => get<String>(keyRole);
  set role(String role) => set<String>(keyRole, role);
}
