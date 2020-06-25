import 'package:malta/data/base/api_response.dart';
import 'package:malta/data/models/student.dart';
import 'package:malta/data/repositories/student/student_contract.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';


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

  @override
  Future<ApiResponse> getParticularSectionsStudents(String section, String schoolId) async{
    QueryBuilder<ParseObject> queryBuilder=QueryBuilder<ParseObject>(ParseObject('Section'))
      ..whereEqualTo('name', section)
      ..whereMatchesQuery('school',QueryBuilder<ParseObject>(ParseObject('School'))
        ..whereEqualTo('objectId', schoolId)
      );
    QueryBuilder<Student> queryBuilder1=QueryBuilder<Student>(Student())
      ..whereMatchesQuery('section', queryBuilder);

    return getApiResponse<Student>(await queryBuilder1.query());
  }


}