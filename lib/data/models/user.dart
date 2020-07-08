import 'dart:core';

import 'package:parse_server_sdk/parse_server_sdk.dart';

class User extends ParseUser implements ParseCloneable {
  User(String username, String password, String emailAddress)
      : super(username, password, emailAddress);

  User.clone() : this(null, null, null);

  @override
  User clone(Map<String, dynamic> map) => User.clone()..fromJson(map);

  static const String keyImage = 'image';
  static const String keyUsername = 'username';

  ParseFile get image => get<ParseFile>(keyImage);
  set image(ParseFile image) => set<ParseFile>(keyImage, image);

  String get name => get<String>(keyUsername);
  set name(String userName) => set<String>(keyUsername, userName);
}
