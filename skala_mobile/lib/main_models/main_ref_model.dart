// To parse this JSON data, do
//
//     final refModel = refModelFromJson(jsonString);

import 'dart:convert';

RefModel refModelFromJson(String str) => RefModel.fromJson(json.decode(str));

String refModelToJson(RefModel data) => json.encode(data.toJson());

class RefModel {
  RefModel({
    this.message,
    this.data,
  });

  final String? message;
  final List<RefDataModel>? data;

  factory RefModel.fromJson(Map<String, dynamic> json) => RefModel(
        message: json["message"],
        data: List<RefDataModel>.from(
            json["data"].map((x) => RefDataModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data?.map((x) => x.toJson()) ?? []),
      };
}

class RefDataModel {
  RefDataModel({
    this.id,
    this.name,
  });

  final int? id;
  final String? name;

  factory RefDataModel.fromJson(Map<String, dynamic> json) => RefDataModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}