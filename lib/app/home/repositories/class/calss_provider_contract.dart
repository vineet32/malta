import 'package:malta/app/home/base/api_response.dart';

abstract class ClassProviderContract {
  // Future<ApiResponse> add(Class item);

  // Future<ApiResponse> addAll(List<Class> items);

  // Future<ApiResponse> update(Class item);

  // Future<ApiResponse> updateAll(List<Class> items);

  // Future<ApiResponse> remove(Class item);

  Future<ApiResponse> getById(String id);

  Future<ApiResponse> getAll();

  Future<ApiResponse> getActive();
}
