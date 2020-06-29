import 'dart:core';

import 'package:parse_server_sdk/parse_server_sdk.dart';

class User extends ParseUser implements ParseCloneable {
  User(String username, String password, String emailAddress)
      : super(username, password, emailAddress);

  User.clone() : this(null, null, null);

  @override
  User clone(Map<String, dynamic> map) => User.clone()..fromJson(map);

  static const String keySchools = 'schools';
  static const String keyImage = 'image';

  List get schools => get<List>(keySchools);
  set schools(List school) => set<List>(keySchools, school);

  String get image => get<String>(keyImage);
  set image(String image) => set<String>(keyImage, image);

}