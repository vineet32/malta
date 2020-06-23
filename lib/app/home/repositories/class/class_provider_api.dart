import 'package:malta/app/home/base/api_response.dart';
import 'package:malta/app/home/models/class.dart';
import 'package:malta/app/home/repositories/class/calss_provider_contract.dart';

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
