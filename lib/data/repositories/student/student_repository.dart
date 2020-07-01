
import 'package:malta/data/base/api_response.dart';
import 'package:malta/data/models/student.dart';
import 'package:malta/data/repositories/student/student_api.dart';
import 'package:malta/data/repositories/student/student_contract.dart';

class StudentRepository implements StudentContract{
  static StudentRepository init({StudentContract mockAPIProvider}) {
    final StudentRepository repository = StudentRepository();
    if (mockAPIProvider != null) {
      repository.api = mockAPIProvider;
    } else {
      repository.api = StudentApi();
    }
    return repository;
  }

  StudentContract api;

  @override
  Future<ApiResponse> add(
      Student item,
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
  Future<ApiResponse> getParticularSectionsStudents(String section, String schoolId) {
    return api.getParticularSectionsStudents(section, schoolId);
  }
}
