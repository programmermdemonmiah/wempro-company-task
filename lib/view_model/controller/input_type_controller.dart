import 'package:flutter/material.dart';
import 'package:project/model/selected_input_model.dart';
import 'package:project/model/types_ui_model.dart';
import 'package:project/res/app_routes/app_routes.dart';
import 'package:project/utils/toast.dart';
import 'package:project/view/selected_input/selected_input_view.dart';
import 'package:project/view_model/services/type_ui_services.dart';

class InputTypeController with ChangeNotifier {
  final TypeUiServices typeUiServices;
  InputTypeController({required this.typeUiServices});
  bool _isIncloudRequiredValue = false;
  bool get isIncloudRequiredValue => _isIncloudRequiredValue;
  String _incloudOutdoorGroupValue = "";
  String get inCloudOutdoorGroupValue => _incloudOutdoorGroupValue;
  FocusNode includeOutdoorAreaFocusNode = FocusNode();
  FocusNode cleaningFrequencyFocusNode = FocusNode();
  final ScrollController scrollController = ScrollController();
  final TextEditingController textController = TextEditingController();
  bool _isCleaningFrequencyRequiredValue = false;
  bool get isCleaningFrequencyRequiredValue =>
      _isCleaningFrequencyRequiredValue;
  String _cleaningFrequencyGroupValue = "";
  String get cleaningFrequencyGroupValue => _cleaningFrequencyGroupValue;
  final List<String> incloudOutdoorVaueList = [
    "Aprtment",
    "Signle Family",
    "Aprtment1"
  ];
  final List<String> cleaningFrequencyValueList = [
    "One Time",
    "Weekly",
    "Bi-Weekly",
    "Monthly"
  ];
  final List<int> dropDownNumber = [0, 1, 2, 3, 4];
  int _numberOfBedrooms = 0;
  int get numberOfBedrooms => _numberOfBedrooms;
  int _numberOfBathrooms = 0;
  int get numberOfBathrooms => _numberOfBathrooms;
  String _includeGarageCleaning = "";
  String get includeGarageCleaning => _includeGarageCleaning;
  String _includeOutdoorAreaCheck = "";
  String get includeOutdoorAreaCheck => _includeOutdoorAreaCheck;
  final List<TypesUiModel> _typeUiList = [];
  List<TypesUiModel> get typeUiList => _typeUiList;

  changeIncloudOutdoorGroupValue(String value) {
    _incloudOutdoorGroupValue = value;
    _isIncloudRequiredValue = true;
    notifyListeners();
  }

  changeCleaningFrequencyGroupValue(String value) {
    _cleaningFrequencyGroupValue = value;
    _isCleaningFrequencyRequiredValue = true;
    notifyListeners();
  }

  changeNumberOfBedRooms(int value) {
    _numberOfBedrooms = value;
    notifyListeners();
  }

  changeNumberOfBathRooms(int value) {
    _numberOfBathrooms = value;
    notifyListeners();
  }

  changeIncludeGarageCleaning(String value) {
    if (value == includeGarageCleaning) {
      _includeGarageCleaning = "";
    } else {
      _includeGarageCleaning = value;
    }
    notifyListeners();
  }

  changeIncludeOutdoorArea(String value) {
    if (value == includeOutdoorAreaCheck) {
      _includeOutdoorAreaCheck = "";
    } else {
      _includeOutdoorAreaCheck = value;
    }

    notifyListeners();
  }

  void scrollToAndFocus(FocusNode focusNode, double focusArea) {
    focusNode.requestFocus();
    scrollController.animateTo(
      scrollController.position.devicePixelRatio + focusArea,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void requestIncludeOutdoorAreaFocus() =>
      scrollToAndFocus(includeOutdoorAreaFocusNode, 0);
  void requestCleaningFrequencyFocus() =>
      scrollToAndFocus(cleaningFrequencyFocusNode, 300);

  submitButton(BuildContext context) {
    List<SelectedInputModel> _list = [
      SelectedInputModel(
          selectedValue: inCloudOutdoorGroupValue,
          title: 'Include Outdoor Area',
          sectionName: 'inCloudOutdoorGroupValue'),
      SelectedInputModel(
          selectedValue: cleaningFrequencyGroupValue,
          title: 'Cleaning Frequency',
          sectionName: 'cleaningFrequencyGroupValue'),
      SelectedInputModel(
          selectedValue: '$numberOfBedrooms Bedrooms',
          title: 'Number of Bedrooms',
          sectionName: 'numberOfBedrooms'),
      SelectedInputModel(
          selectedValue: '$numberOfBathrooms Bathrooms',
          title: 'Number of Bathrooms',
          sectionName: 'numberOfBathrooms'),
    ];

    if (includeOutdoorAreaCheck != "") {
      _list.add(SelectedInputModel(
          selectedValue: includeOutdoorAreaCheck,
          title: "Include Outdoor Area",
          sectionName: 'includeOutdoorAreaCheck'));
    }
    if (includeGarageCleaning != "") {
      _list.add(SelectedInputModel(
          selectedValue: includeGarageCleaning,
          title: "Include Garage Cleaning",
          sectionName: 'includeGarageCleaning'));
    }
    if (textController.text.isNotEmpty) {
      _list.add(SelectedInputModel(
          selectedValue: textController.text,
          title: "Preferred Cleaning Time",
          sectionName: "textController"));
    }

    AppRoutes.goSelectedInputView(context, _list);
  }

  // List<DynamicModel> _variableList = [];
  // List<DynamicModel> get variableList => _variableList;
  // fetchData(BuildContext context) async {
  //   _typeUiList.clear();
  //   final request = await typeUiServices.getTypeUiData();
  //   if (request.isSuccess) {
  //     for (var data in request.data) {
  //       final value = TypesUiModel.fromJson(data);
  //       _typeUiList.add(value);
  //       // if ('${value.type}' == 'radio') {
  //       //   _variableList.add(DynamicModel(variable: ''));
  //       // } else if ('${value.type}' == 'textfield') {
  //       //   _variableList.add(DynamicModel(variable: TextEditingController textEditingController= TextEditingController()));
  //       // }
  //     }
  //   } else {
  //     showErrorToast(context, "Error", request.message);
  //   }
  //   notifyListeners();
  // }

  @override
  void dispose() {
    includeOutdoorAreaFocusNode.dispose();
    cleaningFrequencyFocusNode.dispose();
    scrollController.dispose();
    super.dispose();
  }
}

// class DynamicModel {
//   final dynamic variable;

//   DynamicModel({required this.variable});

//   // factory DynamicModel.fromJson(Map<String, dynamic> json) {
//   //   return DynamicModel(
//   //     variable: json['variable'],
//   //   );
//   // }

//   // Map<String, dynamic> toJson() {
//   //   return {
//   //     'variable': variable,
//   //   };
//   // }
// }
