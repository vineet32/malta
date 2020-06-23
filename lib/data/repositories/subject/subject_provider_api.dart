import 'package:malta/data/base/api_response.dart';
import 'package:malta/data/models/subject.dart';
import 'package:malta/data/repositories/subject/subject_provider_contract.dart';

class SubjectProviderApi implements SubjectProviderContract {
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
  Future<ApiResponse> getBySchoolId(String id) async {
    return getApiResponse<Subject>(await Subject().getBySchoolId(id));
  }
}
