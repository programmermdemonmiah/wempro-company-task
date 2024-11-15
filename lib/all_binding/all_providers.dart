import 'package:project/data/api_client/api_client.dart';
import 'package:project/utils/app_constant.dart';
import 'package:project/view_model/controller/input_type_controller.dart';
import 'package:project/view_model/services/type_ui_services.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> allProviders = [
  ChangeNotifierProvider(
      create: (context) => InputTypeController(
          typeUiServices: TypeUiServices(
              apiClient: ApiClient(appBaseUrl: AppConstant.baseUrl)))),
];
