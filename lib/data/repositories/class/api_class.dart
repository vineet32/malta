import 'package:malta/data/base/api_response.dart';
import 'package:malta/data/models/class.dart';
import 'package:malta/data/repositories/class/contract_class.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class ApiClass implements ContractClass {
  ApiClass();

  @override
  Future<ApiResponse> getAll() async {
    return getApiResponse<Class>(await Class().getAll());
  }

  @override
  Future<ApiResponse> getById(String id) async {
    return getApiResponse<Class>(await Class().getObject(id));
  }

  @override
  Future<ApiResponse> getActive(String schoolId) async {
    QueryBuilder<Class> queryBuilder = QueryBuilder<Class>(Class())
      ..whereEqualTo(Class.keyActive, true)
      ..whereMatchesQuery(
          Class.keySchool,
          QueryBuilder(ParseObject("School"))
            ..whereEqualTo("objectId", schoolId))
      ..includeObject([Class.keySubject]);

    return getApiResponse<Class>(await queryBuilder.query());
  }

  @override
  Future<ApiResponse> add(Class item) async {
    return getApiResponse<Class>(await item.save());
  }
}
