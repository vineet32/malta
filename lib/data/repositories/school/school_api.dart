import 'package:malta/data/base/api_response.dart';
import 'package:malta/data/models/school.dart';
import 'package:malta/data/repositories/school/school_contract.dart';

class SchoolApi implements SchoolContract {
  SchoolApi();

  @override
  Future<ApiResponse> add(School item) async {
    return getApiResponse<School>(await item.save());
  }

  @override
  Future<ApiResponse> addAll(List<School> items) async {
    final List<School> responses = List<School>();

    for (final School item in items) {
      final ApiResponse response = await add(item);

      if (!response.success) {
        return response;
      }

      response?.results?.forEach(responses.add);
    }

    return ApiResponse(true, 200, responses, null);
  }

  @override
  Future<ApiResponse> getAll() async {
    return getApiResponse<School>(await School().getAll());
  }

  @override
  Future<ApiResponse> getById(String id) async {
    return getApiResponse<School>(await School().getObject(id));
  }

  @override
  Future<ApiResponse> remove(School item) async {
    return getApiResponse<School>(await item.delete());
  }

  @override
  Future<ApiResponse> update(School item) async {
    return getApiResponse<School>(await item.save());
  }

  @override
  Future<ApiResponse> updateAll(List<School> items) async {
    final List<School> responses = List<School>();

    for (final School item in items) {
      final ApiResponse response = await update(item);

      if (!response.success) {
        return response;
      }

      response?.results?.forEach(responses.add);
    }

    return ApiResponse(true, 200, responses, null);
  }
}