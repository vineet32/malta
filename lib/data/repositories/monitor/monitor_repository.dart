
import 'package:malta/data/base/api_response.dart';
import 'package:malta/data/models/class.dart';
import 'package:malta/data/models/school.dart';
import 'package:malta/data/models/section.dart';
import 'package:malta/data/repositories/monitor/monitor_api.dart';
import 'package:malta/data/repositories/monitor/monitor_contract.dart';

class MonitorRepository implements MonitorContract{
  static MonitorRepository init({MonitorContract mockAPIProvider}) {
    final MonitorRepository repository = MonitorRepository();
    if (mockAPIProvider != null) {
      repository.api = mockAPIProvider;
    } else {
      repository.api = MonitorApi();
    }
    return repository;
  }

  MonitorContract api;


  @override
  Future<ApiResponse> getAllStudents(Section section, School school, Class currentClass) async{
   return await api.getAllStudents(section, school, currentClass);
  }


}