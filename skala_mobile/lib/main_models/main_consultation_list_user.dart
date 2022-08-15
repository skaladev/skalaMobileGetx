// To parse this JSON data, do
//
//     final consultationListUserModel = consultationListUserModelFromJson(jsonString);

import 'dart:convert';

ConsultationListUserModel consultationListUserModelFromJson(String str) =>
    ConsultationListUserModel.fromJson(json.decode(str));

String consultationListUserModelToJson(ConsultationListUserModel data) =>
    json.encode(data.toJson());

class ConsultationListUserModel {
  ConsultationListUserModel({
    this.message,
    this.data,
  });

  final String? message;
  final List<ConsultationListUserModelData>? data;

  factory ConsultationListUserModel.fromJson(Map<String, dynamic> json) =>
      ConsultationListUserModel(
        message: json["message"],
        data: List<ConsultationListUserModelData>.from(
            json["data"].map((x) => ConsultationListUserModelData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data?.map((x) => x.toJson()) ?? []),
      };
}

class ConsultationListUserModelData {
  ConsultationListUserModelData({
    this.id,
    this.user,
    this.profession,
  });

  final int? id;
  final String? user;
  final String? profession;

  factory ConsultationListUserModelData.fromJson(Map<String, dynamic> json) =>
      ConsultationListUserModelData(
        id: json["id"],
        user: json["user"],
        profession: json["profession"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user,
        "profession": profession,
      };
}
