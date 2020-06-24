import 'package:malta/data/base/api_response.dart';
import 'package:malta/data/models/student.dart';
import 'package:malta/data/repositories/student/student_contract.dart';


class StudentApi implements StudentContract {
  StudentApi();

  @override
  Future<ApiResponse> getAll() async {
    return getApiResponse<Student>(await Student().getAll());
  }

  @override
  Future<ApiResponse> getById(String id) async {
    return getApiResponse<Student>(await Student().getObject(id));
  }

  @override
  Future<ApiResponse> add(Student item) async{
    return getApiResponse<Student>(await item.save());
  }


}