import 'package:malta/data/base/api_response.dart';
import 'package:malta/data/models/school.dart';

abstract class SectionContract {
  // Future<ApiResponse> add(Section item);

  // Future<ApiResponse> addAll(List<Section> items);

  // Future<ApiResponse> update(Section item);

  // Future<ApiResponse> updateAll(List<Section> items);

  // Future<ApiResponse> remove(Section item);

  Future<ApiResponse> getById(String id);

  Future<ApiResponse> getAll();

  Future<ApiResponse> getBySchoolId(School school);
}
