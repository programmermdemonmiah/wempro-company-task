import 'dart:convert';

List<TypesUiModel> typesUiModelFromJson(String str) => List<TypesUiModel>.from(
    json.decode(str).map((x) => TypesUiModel.fromJson(x)));

String typesUiModelToJson(List<TypesUiModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TypesUiModel {
  final String? id;
  final String? title;
  final String? type;
  final List<String> options;
  String? selectedValue;

  TypesUiModel({
    this.id,
    this.title,
    this.type,
    List<String>? options,
    this.selectedValue,
  }) : options = options ?? [];

  factory TypesUiModel.fromJson(Map<String, dynamic> json) => TypesUiModel(
        id: json["id"],
        title: json["title"],
        type: json["type"],
        options: json["options"] == null
            ? []
            : List<String>.from(json["options"]!.map((x) => x)),
        selectedValue: json["selectedValue"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "type": type,
        "options":
            options.isEmpty ? [] : List<dynamic>.from(options.map((x) => x)),
        "selectedValue": selectedValue,
      };

  set selectedValueSetter(String? value) {
    selectedValue = value;
  }
}
