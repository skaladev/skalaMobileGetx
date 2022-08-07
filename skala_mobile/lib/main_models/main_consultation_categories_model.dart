// To parse this JSON data, do
//
//     final consultationCategoriesModel = consultationCategoriesModelFromJson(jsonString);

import 'dart:convert';

ConsultationCategoriesModel consultationCategoriesModelFromJson(String str) => ConsultationCategoriesModel.fromJson(json.decode(str));

String consultationCategoriesModelToJson(ConsultationCategoriesModel data) => json.encode(data.toJson());

class ConsultationCategoriesModel {
    ConsultationCategoriesModel({
        this.message,
        this.data,
    });

   final String? message;
   final List<ConsultationCategoriesModelData>? data;

    factory ConsultationCategoriesModel.fromJson(Map<String, dynamic> json) => ConsultationCategoriesModel(
        message: json["message"],
        data: List<ConsultationCategoriesModelData>.from(json["data"].map((x) => ConsultationCategoriesModelData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data?.map((x) => x.toJson())??[]),
    };
}

class ConsultationCategoriesModelData {
    ConsultationCategoriesModelData({
        this.id,
        this.name,
    });

  final  int? id;
  final  String? name;

    factory ConsultationCategoriesModelData.fromJson(Map<String, dynamic> json) => ConsultationCategoriesModelData(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
