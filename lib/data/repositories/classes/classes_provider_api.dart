import 'package:malta/data/base/api_response.dart';
import 'package:malta/data/models/classes.dart';
import 'package:malta/data/repositories/classes/classes_provider_contract.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class ClassesProviderApi implements ClassesProviderContract {
  ClassesProviderApi();

  @override
  Future<ApiResponse> getAll() async {
    return getApiResponse<Classes>(await Classes().getAll());
  }

  @override
  Future<ApiResponse> getById(String id) async {
    return getApiResponse<Classes>(await Classes().getObject(id));
  }

  Future<ApiResponse> getActive() async {
    QueryBuilder<Classes> queryBuilder = QueryBuilder<Classes>(Classes())
      ..whereEqualTo(Classes.keyActive, true);
    return getApiResponse<Classes>(await queryBuilder.query());
  }
}
