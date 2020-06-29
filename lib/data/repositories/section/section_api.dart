import 'package:malta/data/base/api_response.dart';
import 'package:malta/data/models/section.dart';
import 'package:malta/data/repositories/section/section_contract.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class SectionApi implements SectionContract {
  SectionApi();

  @override
  Future<ApiResponse> getAll() async {
    return getApiResponse<Section>(await Section().getAll());
  }

  @override
  Future<ApiResponse> getById(String id) async {
    return getApiResponse<Section>(await Section().getObject(id));
  }

  @override
  Future<ApiResponse> getBySchoolId(String schoolId) async {
    QueryBuilder<Section> queryBuilder = QueryBuilder<Section>(Section())
      ..whereMatchesQuery(
          Section.keySchool,
          QueryBuilder(ParseObject("School"))
            ..whereEqualTo("objectId", schoolId));
    return getApiResponse<Section>(await queryBuilder.query());
  }
}