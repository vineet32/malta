import 'package:malta/data/base/api_response.dart';
import 'package:malta/data/models/class.dart';
import 'package:malta/data/repositories/class/class_provider_contract.dart';

class ClassProviderApi implements ClassProviderContract {
  ClassProviderApi();

  @override
  Future<ApiResponse> getAll() async {
    return getApiResponse<Class>(await Class().getAll());
  }

  @override
  Future<ApiResponse> getById(String id) async {
    return getApiResponse<Class>(await Class().getObject(id));
  }

  @override
  Future<ApiResponse> getActive() async {
    return getApiResponse<Class>(await Class().getActive);
  }
}
