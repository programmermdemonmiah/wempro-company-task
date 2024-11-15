// To parse this JSON data, do
//
//     final typesUiModel = typesUiModelFromJson(jsonString);

import 'dart:convert';

List<TypesUiModel> typesUiModelFromJson(String str) => List<TypesUiModel>.from(
    json.decode(str).map((x) => TypesUiModel.fromJson(x)));

String typesUiModelToJson(List<TypesUiModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TypesUiModel {
  final String? id;
  final String? title;
  final String? type;
  final List<String>? options;

  TypesUiModel({
    this.id,
    this.title,
    this.type,
    this.options,
  });

  factory TypesUiModel.fromJson(Map<String, dynamic> json) => TypesUiModel(
        id: json["id"],
        title: json["title"],
        type: json["type"],
        options: json["options"] == null
            ? []
            : List<String>.from(json["options"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "type": type,
        "options":
            options == null ? [] : List<dynamic>.from(options!.map((x) => x)),
      };
}
