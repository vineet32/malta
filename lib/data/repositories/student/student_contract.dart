import 'package:malta/data/base/api_response.dart';
import 'package:malta/data/models/section.dart';
import 'package:malta/data/models/student.dart';

abstract class StudentContract {
   Future<ApiResponse> add(Student item);

  // Future<ApiResponse> addAll(List<Student> items);

  // Future<ApiResponse> update(Student item);

  // Future<ApiResponse> updateAll(List<Student> items);

  // Future<ApiResponse> remove(Student item);

  Future<ApiResponse> getById(String id);

  Future<ApiResponse> getAll();

  Future<ApiResponse> getParticularSectionsStudents(String section,String schoolId);

  Future<ApiResponse> getBySectionId(Section section);

}