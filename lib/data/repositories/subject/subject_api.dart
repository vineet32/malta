import 'package:malta/data/base/api_response.dart';
import 'package:malta/data/models/school.dart';
import 'package:malta/data/models/subject.dart';
import 'package:malta/data/repositories/subject/subject_contract.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class SubjectApi implements SubjectContract {
  SubjectApi();

  @override
  Future<ApiResponse> getAll() async {
    return getApiResponse<Subject>(await Subject().getAll());
  }

  @override
  Future<ApiResponse> getById(String id) async {
    return getApiResponse<Subject>(await Subject().getObject(id));
  }

  @override
  Future<ApiResponse> getBySchoolId(School school) async {
    QueryBuilder<Subject> queryBuilder = QueryBuilder<Subject>(Subject())
      ..whereEqualTo(Subject.keySchool, school)
      ..includeObject([Subject.keySchool]);

    return getApiResponse<Subject>(await queryBuilder.query());
  }

  @override
  Future<ApiResponse> add(Subject subject) async {
    return getApiResponse(await subject.save());
  }
}
