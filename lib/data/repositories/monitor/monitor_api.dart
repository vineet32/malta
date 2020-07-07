import 'package:malta/data/base/api_response.dart';
import 'package:malta/data/models/class.dart';
import 'package:malta/data/models/monitor.dart';
import 'package:malta/data/models/school.dart';
import 'package:malta/data/models/section.dart';
import 'package:malta/data/models/student.dart';
import 'package:malta/data/repositories/monitor/monitor_contract.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class MonitorApi implements MonitorContract {
  @override
  Future<ApiResponse> getAllStudents(Section section, School school,Class currentClass)async {
    QueryBuilder<Student> queryBuilder = QueryBuilder<Student>(Student())
      ..whereEqualTo('section', section)
      ..whereEqualTo('school', school);

    QueryBuilder<Monitor> queryBuilder1 = QueryBuilder<Monitor>(Monitor())
      ..whereEqualTo('class', currentClass)
      ..whereMatchesQuery('student',queryBuilder )
      ..includeObject(['student']);

    return getApiResponse<Monitor>(await queryBuilder1.query());
  }

}