import 'package:malta/data/base/api_response.dart';
import 'package:malta/data/repositories/subject/subject_api.dart';
import 'package:malta/data/repositories/subject/subject_contract.dart';

class SubjectRepository implements SubjectContract {
  static SubjectRepository init({SubjectContract mockAPIProvider}) {
    final SubjectRepository repository = SubjectRepository();
    if (mockAPIProvider != null) {
      repository.api = mockAPIProvider;
    } else {
      repository.api = SubjectApi();
    }
    return repository;
  }

  SubjectContract api;

  @override
  Future<ApiResponse> getAll() {
    return api.getAll();
  }

  @override
  Future<ApiResponse> getById(
    String id,
  ) {
    return api.getAll();
  }

  @override
  Future<ApiResponse> getBySchoolId(String id) {
    return api.getBySchoolId(id);
  }
}
