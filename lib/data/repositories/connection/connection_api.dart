import 'package:malta/data/base/api_response.dart';
import 'package:malta/data/models/connection.dart';
import 'package:malta/data/models/school.dart';
import 'package:malta/data/models/user.dart';
import 'package:malta/data/repositories/connection/connection_contract.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class ConnectionApi implements ConnectionContract{
  @override
  Future<ApiResponse> getAllSchool(User user) async{
    QueryBuilder<Connection> queryBuilder=QueryBuilder<Connection>(Connection())
        ..whereEqualTo('user', user);

    return getApiResponse<Connection>(await queryBuilder.query());
  }

  @override
  Future<ApiResponse> getAllUser(String schoolId , String role)async {

    QueryBuilder<Connection> queryBuilder=QueryBuilder<Connection>(Connection())
      ..whereEqualTo('role', role)
      ..whereMatchesQuery('school',QueryBuilder<School>(School())
        ..whereEqualTo('objectId', schoolId)
      )..includeObject([
        Connection.keyUser,
        Connection.keySchool,
      ]);

    return getApiResponse<Connection>(await queryBuilder.query());
  }

}