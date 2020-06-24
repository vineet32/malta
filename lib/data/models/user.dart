import 'dart:core';

import 'package:parse_server_sdk/parse_server_sdk.dart';

class User extends ParseUser implements ParseCloneable {
  User(String username, String password, String emailAddress)
      : super(username, password, emailAddress);

  User.clone() : this(null, null, null);

  @override
  User clone(Map<String, dynamic> map) => User.clone()..fromJson(map);

  static const String keyEmailVerified = 'emailVerified';
  static const String keySchools = 'schools';

  bool get emailVeified => get<bool>(keyEmailVerified);
  set emailVerified(bool emailVeified) => set<bool>(keyEmailVerified, emailVeified);

  List get schools => get<List>(keySchools);
  set schools(List school) => set<List>(keySchools, school);
}