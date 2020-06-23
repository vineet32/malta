

import 'package:malta/data/base/api_response.dart';

abstract class SubjectProvider {
  // Future<ApiResponse> add(Subject item);

  // Future<ApiResponse> addAll(List<Subject> items);

  // Future<ApiResponse> update(Subject item);

  // Future<ApiResponse> updateAll(List<Subject> items);

  // Future<ApiResponse> remove(Subject item);

  Future<ApiResponse> getById(String id);

  Future<ApiResponse> getAll();

  Future<ApiResponse> getBySchoolId(String id);
}
