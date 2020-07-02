import 'package:malta/data/base/api_response.dart';
import 'package:malta/data/models/user.dart';

abstract class ConnectionContract {

  Future<ApiResponse> getAllUser(String schoolId,String role);

  Future<ApiResponse> getAllSchool(User user);

}