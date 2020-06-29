import 'package:malta/data/base/api_response.dart';
import 'package:malta/data/models/class.dart';
import 'package:malta/data/repositories/class/class_api.dart';
import 'package:malta/data/repositories/class/class_contract.dart';

class ClassRepository implements ClassContract {
  static ClassRepository init({ClassContract mockAPIProvider}) {
    final ClassRepository repository = ClassRepository();
    if (mockAPIProvider != null) {
      repository.api = mockAPIProvider;
    } else {
      repository.api = ClassApi();
    }
    return repository;
  }

  ClassContract api;

  @override
  Future<ApiResponse> add(
    Class item,
  ) async {
    return await api.add(item);
  }

  @override
  Future<ApiResponse> getAll({bool fromApi = false}) {
    return api.getAll();
  }

  @override
  Future<ApiResponse> getById(
    String id,
  ) async {
    return api.getAll();
  }

  @override
  Future<ApiResponse> getActive(String id) {
    return api.getActive(id);
  }
}
