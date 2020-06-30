import 'package:malta/data/base/api_response.dart';
import 'package:malta/data/models/class.dart';
import 'package:malta/data/models/school.dart';
import 'package:malta/data/repositories/class/class_contract.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class ClassApi implements ClassContract {
  ClassApi();

  @override
  Future<ApiResponse> getAll() async {
    return getApiResponse<Class>(await Class().getAll());
  }

  @override
  Future<ApiResponse> getById(String id) async {
    return getApiResponse<Class>(await Class().getObject(id));
  }

  @override
  Future<ApiResponse> getActive(School school) async {
    QueryBuilder<Class> queryBuilder = QueryBuilder<Class>(Class())
      ..whereEqualTo(Class.keyActive, true)
      ..whereEqualTo(Class.keySchool, school)
      ..includeObject(
        [
          Class.keySubject,
          Class.keySections,
          Class.keySchool,
          Class.keyTeacher,
        ],
      );

    return getApiResponse<Class>(await queryBuilder.query());
  }

  @override
  Future<ApiResponse> add(Class item) async {
    return getApiResponse<Class>(await item.save());
  }
}
