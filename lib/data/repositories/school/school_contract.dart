import 'package:malta/data/base/api_response.dart';
import 'package:malta/data/models/school.dart';
import 'package:malta/data/models/user.dart';

abstract class SchoolContract {
  Future<ApiResponse> add(School item);

  Future<ApiResponse> addAll(List<School> items);

  Future<ApiResponse> update(School item);

  Future<ApiResponse> updateAll(List<School> items);

  Future<ApiResponse> remove(School item);

  Future<ApiResponse> getById(String id);

  Future<ApiResponse> getByUser(User user);

  Future<ApiResponse> getAll();
}