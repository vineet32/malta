import 'package:malta/data/base/api_response.dart';
import 'package:malta/data/models/user.dart';

abstract class UserContract {
  Future<User> createUser(
      String username, String password, String emailAddress);
  Future<User> currentUser();
  Future<ApiResponse> signUp(User user);
  Future<ApiResponse> login(User user);
  void logout(User user);
  Future<ApiResponse> getCurrentUserFromServer();
  Future<ApiResponse> requestPasswordReset(User user);
  Future<ApiResponse> verificationEmailRequest(User user);
  Future<ApiResponse> save(User user, {String sessionToken});
  Future<ApiResponse> destroy(User user);
  Future<ApiResponse> allUsers();
}