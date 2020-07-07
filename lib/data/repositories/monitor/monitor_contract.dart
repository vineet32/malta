import 'package:malta/data/base/api_response.dart';
import 'package:malta/data/models/class.dart';
import 'package:malta/data/models/school.dart';
import 'package:malta/data/models/section.dart';

abstract class MonitorContract {
  Future<ApiResponse> getAllStudents(Section section, School school,Class currentClass);

}