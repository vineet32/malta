import 'package:malta/data/base/api_response.dart';
import 'package:malta/data/models/subject.dart';
import 'package:malta/data/repositories/subject/subject_provider.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class SubjectProviderApi implements SubjectProvider {
  SubjectProviderApi();

  @override
  Future<ApiResponse> getAll() async {
    return getApiResponse<Subject>(await Subject().getAll());
  }

  @override
  Future<ApiResponse> getById(String id) async {
    return getApiResponse<Subject>(await Subject().getObject(id));
  }

  @override
  Future<ApiResponse> getBySchoolId(String schoolId) async {
    QueryBuilder<Subject> queryBuilder = QueryBuilder<Subject>(Subject())
      ..whereMatchesQuery(
          Subject.keySchool,
          QueryBuilder(ParseObject("School"))
            ..whereEqualTo("objectId", schoolId));
    return getApiResponse<Subject>(await queryBuilder.query());
  }
}
