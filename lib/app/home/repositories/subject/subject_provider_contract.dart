import 'package:malta/app/home/base/api_response.dart';

abstract class SubjectProviderContract {
  // Future<ApiResponse> add(Subject item);

  // Future<ApiResponse> addAll(List<Subject> items);

  // Future<ApiResponse> update(Subject item);

  // Future<ApiResponse> updateAll(List<Subject> items);

  // Future<ApiResponse> remove(Subject item);

  Future<ApiResponse> getById(String id);

  Future<ApiResponse> getAll();

}
