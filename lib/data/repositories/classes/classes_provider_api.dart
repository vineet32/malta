import 'package:malta/data/base/api_response.dart';
import 'package:malta/data/models/classes.dart';
import 'package:malta/data/repositories/classes/classes_provider.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class ClassesProviderApi implements ClassesProvider {
  ClassesProviderApi();

  @override
  Future<ApiResponse> getAll() async {
    return getApiResponse<Classes>(await Classes().getAll());
  }

  @override
  Future<ApiResponse> getById(String id) async {
    return getApiResponse<Classes>(await Classes().getObject(id));
  }

  @override
  Future<ApiResponse> getActive(String schoolId) async {
    QueryBuilder<Classes> queryBuilder = QueryBuilder<Classes>(Classes())
      ..whereEqualTo(Classes.keyActive, true)
      ..whereMatchesQuery(
          Classes.keySchool,
          QueryBuilder(ParseObject("School"))
            ..whereEqualTo("objectId", schoolId))
      ..includeObject([Classes.keySubject]);

    return getApiResponse<Classes>(await queryBuilder.query());
  }
}
