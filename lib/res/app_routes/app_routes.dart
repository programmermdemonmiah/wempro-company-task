import 'package:flutter/material.dart';
import 'package:project/model/types_ui_model.dart';
import 'package:project/res/app_routes/app_routes_name.dart';
import 'package:project/view/home/home_view.dart';
import 'package:project/view/input_types/input_types_view.dart';
import 'package:project/view/selected_input/selected_input_view.dart';
import 'package:project/view/splash/splash_view.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> appRoutes = {
    AppRoutesName.splash: (context) => const SplashView(),
    AppRoutesName.homeView: (context) => const HomeView(),
    AppRoutesName.inputTypesView: (context) {
      final args = ModalRoute.of(context)?.settings.arguments;
      if (args != null) {
        return InputTypesView(inputModelList: args as List<TypesUiModel>);
      } else {
        return const InputTypesView();
      }
    },
    AppRoutesName.selectedInputView: (context) {
      final args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      final dataList = args['dataList'] as List<TypesUiModel>;
      final selectedInputCount = args['selectedInputCount'] as int;

      return SelectedInputView(
        inputModelList: dataList,
        selectedInputCount: selectedInputCount,
      );
    },
  };

  static goInputTypeView(BuildContext context, {List<TypesUiModel>? data}) =>
      Navigator.pushNamed(context, AppRoutesName.inputTypesView,
          arguments: data ?? null);

  static goSelectedInputView(BuildContext context, List<TypesUiModel> data,
          int selectedInputCount) =>
      Navigator.pushNamed(context, AppRoutesName.selectedInputView, arguments: {
        "dataList": data,
        "selectedInputCount": selectedInputCount
      });
}
