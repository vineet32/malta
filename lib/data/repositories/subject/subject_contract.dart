import 'package:malta/data/base/api_response.dart';
import 'package:malta/data/models/school.dart';
import 'package:malta/data/models/subject.dart';

abstract class SubjectContract {

  // Future<ApiResponse> addAll(List<Subject> items);

  // Future<ApiResponse> update(Subject item);

  // Future<ApiResponse> updateAll(List<Subject> items);

  // Future<ApiResponse> remove(Subject item);

  Future<ApiResponse> getById(String id);

  Future<ApiResponse> getAll();

  Future<ApiResponse> getBySchoolId(School school);

  Future<ApiResponse> add(Subject subject);

}
