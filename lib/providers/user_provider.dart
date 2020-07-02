import 'package:malta/data/models/user.dart';

class UserProvider {

  User user;

  void setCurrentUser(User currentUser) {
    user = currentUser;
  }

  User get getCurrentUser => user;

}