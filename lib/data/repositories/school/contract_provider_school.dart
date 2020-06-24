import 'package:malta/data/base/api_response.dart';
import 'package:malta/data/models/school.dart';

abstract class SchoolProviderContract {
  Future<ApiResponse> add(School item);

  Future<ApiResponse> addAll(List<School> items);

  Future<ApiResponse> update(School item);

  Future<ApiResponse> updateAll(List<School> items);

  Future<ApiResponse> remove(School item);

  Future<ApiResponse> getById(String id);

  Future<ApiResponse> getAll();

  Future<ApiResponse> getNewerThan(DateTime date);
}