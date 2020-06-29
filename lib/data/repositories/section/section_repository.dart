import 'package:malta/data/base/api_response.dart';
import 'package:malta/data/repositories/section/section_api.dart';
import 'package:malta/data/repositories/section/section_contract.dart';

class SectionRepository implements SectionContract {
  static SectionRepository init({SectionContract mockAPIProvider}) {
    final SectionRepository repository = SectionRepository();
    if (mockAPIProvider != null) {
      repository.api = mockAPIProvider;
    } else {
      repository.api = SectionApi();
    }
    return repository;
  }

  SectionContract api;

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