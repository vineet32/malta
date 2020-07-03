import 'package:malta/data/base/api_response.dart';
import 'package:malta/data/models/connection.dart';
import 'package:malta/data/models/school.dart';
import 'package:malta/data/models/user.dart';
import 'package:malta/data/repositories/connection/connection_contract.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class ConnectionApi implements ConnectionContract{
  @override
  Future<ApiResponse> getAllSchools(User user) async{
    QueryBuilder<Connection> queryBuilder=QueryBuilder<Connection>(Connection())
      ..whereEqualTo('user', user)..includeObject([Connection.keySchool]);

    return getApiResponse<Connection>(await queryBuilder.query());
  }

  @override
  Future<ApiResponse> getAllUsers(School school , String role)async {

    QueryBuilder<Connection> queryBuilder=QueryBuilder<Connection>(Connection())
      ..whereEqualTo('role', role)
      ..whereEqualTo('school',school)..includeObject([
        Connection.keyUser,
        Connection.keySchool,
      ]);

    return getApiResponse<Connection>(await queryBuilder.query());
  }

  @override
  Future<ApiResponse> getUserByUserName(String userName)async {

    QueryBuilder<User> queryBuilder=QueryBuilder<User>(User('d','d','d'))
      ..whereEqualTo('username', userName);

    return getApiResponse<User>(await queryBuilder.query());
  }

  @override
  Future<ApiResponse> add(Connection connection) async{
    return getApiResponse<Connection>(await connection.save());
  }

}