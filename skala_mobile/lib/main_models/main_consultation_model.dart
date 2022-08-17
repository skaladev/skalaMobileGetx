// To parse this JSON data, do
//
//     final consultationModel = consultationModelFromJson(jsonString);

import 'dart:convert';

ConsultationModel consultationModelFromJson(String str) =>
    ConsultationModel.fromJson(json.decode(str));

String consultationModelToJson(ConsultationModel data) =>
    json.encode(data.toJson());

class ConsultationModel {
  ConsultationModel({
    this.message,
    this.data,
  });

  final String? message;
  final List<ConsultationModelData>? data;

  factory ConsultationModel.fromJson(Map<String, dynamic> json) =>
      ConsultationModel(
        message: json["message"],
        data: List<ConsultationModelData>.from(json["data"].map((x) =>ConsultationModelData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data?.map((x) => x.toJson()) ?? []),
      };
}

class ConsultationModelData {
 ConsultationModelData({
    this.id,
    this.title,
    this.category,
    this.date,
    this.time,
    this.status,
    this.toUser,
  });

  final int? id;
  final String? title;
  final String? category;
  final DateTime? date;
  final String? time;
  final String? status;
  final String? toUser;

  factory ConsultationModelData.fromJson(Map<String, dynamic> json) => ConsultationModelData(
        id: json["id"],
        title: json["title"],
        category: json["category"],
        date: DateTime.parse(json["date"]),
        time: json["time"],
        status: json["status"],
        toUser: json["to_user"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "category": category,
        "date":
            "${date?.year.toString().padLeft(4, '0')}-${date?.month.toString().padLeft(2, '0')}-${date?.day.toString().padLeft(2, '0')}",
        "time": time,
        "status": status,
        "to_user": toUser,
      };
}
