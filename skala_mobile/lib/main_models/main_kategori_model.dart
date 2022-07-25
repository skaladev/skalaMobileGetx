// To parse this JSON data, do
//
//     final kategoriModel = kategoriModelFromJson(jsonString);

import 'dart:convert';

KategoriModel kategoriModelFromJson(String str) =>
    KategoriModel.fromJson(json.decode(str));

String kategoriModelToJson(KategoriModel data) => json.encode(data.toJson());

class KategoriModel {
  KategoriModel({
    this.message,
    this.data,
  });

  final String? message;
  final List<KategoriModelData>? data;

  factory KategoriModel.fromJson(Map<String, dynamic> json) => KategoriModel(
        message: json["message"],
        data: List<KategoriModelData>.from(
            json["data"].map((x) => KategoriModelData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data?.map((x) => x.toJson()) ?? []),
      };
}

class KategoriModelData {
  KategoriModelData({
    this.id,
    this.name,
  });

  final int? id;
  final String? name;

  factory KategoriModelData.fromJson(Map<String, dynamic> json) =>
      KategoriModelData(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
