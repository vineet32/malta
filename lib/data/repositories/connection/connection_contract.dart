import 'package:malta/data/base/api_response.dart';
import 'package:malta/data/models/connection.dart';
import 'package:malta/data/models/school.dart';
import 'package:malta/data/models/user.dart';

abstract class ConnectionContract {
  Future<ApiResponse> getAllUsers(School school, String role);

  Future<ApiResponse> getAllSchools(User user);

  Future<ApiResponse> add(Connection connection);

  Future<ApiResponse> getUserSchools(Connection conn);
}
