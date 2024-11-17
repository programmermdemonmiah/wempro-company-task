import 'package:flutter/material.dart';
import 'package:project/model/types_ui_model.dart';
import 'package:project/res/app_routes/app_routes.dart';
import 'package:project/utils/toast.dart';
import 'package:project/view/selected_input/selected_input_view.dart';
import 'package:project/view_model/services/type_ui_services.dart';

class InputTypeController with ChangeNotifier {
  final TypeUiServices typeUiServices;
  InputTypeController({required this.typeUiServices});
  final List<TypesUiModel> _typeUiList = [];
  List<TypesUiModel> get typeUiList => _typeUiList;

  submitButton(
      BuildContext context, List<TypesUiModel> _list, int selectedInputCount) {
    AppRoutes.goSelectedInputView(context, _list, selectedInputCount);
  }

  fetchData(BuildContext context) async {
    _typeUiList.clear();
    final request = await typeUiServices.getTypeUiData();
    if (request.isSuccess) {
      for (var data in request.data) {
        final value = TypesUiModel.fromJson(data);
        _typeUiList.add(value);
      }
    } else {
      showErrorToast(context, "Error", request.message);
    }
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
