// To parse this JSON data, do
//
//     final consultantListModel = consultantListModelFromJson(jsonString);

import 'dart:convert';

ConsultantListModel consultantListModelFromJson(String str) =>
    ConsultantListModel.fromJson(json.decode(str));

String consultantListModelToJson(ConsultantListModel data) =>
    json.encode(data.toJson());

class ConsultantListModel {
  ConsultantListModel({
    this.message,
    this.data,
  });

  final String? message;
  final List<ConsultantListModelData>? data;

  factory ConsultantListModel.fromJson(Map<String, dynamic> json) =>
      ConsultantListModel(
        message: json["message"],
        data: List<ConsultantListModelData>.from(
            json["data"].map((x) => ConsultantListModelData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data?.map((x) => x.toJson()) ?? []),
      };
}

class ConsultantListModelData {
  ConsultantListModelData({
    this.id,
    this.name,
    this.consultantCategory,
    this.workExperienceTimes,
    this.rating,
    this.isActive,
  });

  final int? id;
  final String? name;
  final String? consultantCategory;
  final int? workExperienceTimes;
  final int? rating;
  final bool? isActive;

  factory ConsultantListModelData.fromJson(Map<String, dynamic> json) =>
      ConsultantListModelData(
        id: json["id"],
        name: json["name"],
        consultantCategory: json["consultant_category"],
        workExperienceTimes: json["work_experience_times"],
        rating: json["rating"],
        isActive: json["is_active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "consultant_category": consultantCategory,
        "work_experience_times": workExperienceTimes,
        "rating": rating,
        "is_active": isActive,
      };
}
