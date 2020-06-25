import 'package:malta/data/base/api_response.dart';
import 'package:malta/data/models/class.dart';

abstract class ContractClass {
  Future<ApiResponse> add(Class item);

  // Future<ApiResponse> addAll(List<Class> items);

  // Future<ApiResponse> update(Class item);

  // Future<ApiResponse> updateAll(List<Class> items);

  // Future<ApiResponse> remove(Class item);

  Future<ApiResponse> getById(String id);

  Future<ApiResponse> getAll();

  Future<ApiResponse> getActive(String id);
}
