import 'package:project/data/api_client/api_client.dart';
import 'package:project/data/api_response/api_response.dart';
import 'package:project/utils/app_constant.dart';

class TypeUiServices {
  final ApiClient apiClient;
  TypeUiServices({required this.apiClient});

  Future<ResponseModel> getTypeUiData() async {
    return apiClient.requestWrapper(
      () async {
        final response = await apiClient.instance.get(AppConstant.typeUiUri());
        final data = response.data['json_response']['attributes'];
        return ResponseModel(true, "successfully data call", data);
      },
    );
  }
}
