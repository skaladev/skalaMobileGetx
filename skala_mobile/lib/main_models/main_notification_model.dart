// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

NotificationModel notificationModelFromJson(String str) =>
    NotificationModel.fromJson(json.decode(str));

String notificationModelToJson(NotificationModel data) =>
    json.encode(data.toJson());

class NotificationModel {
  NotificationModel({
    this.message,
    this.data,
  });

  final String? message;
  final List<NotificationModelData>? data;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        message: json["message"],
        data: List<NotificationModelData>.from(
            json["data"].map((x) => NotificationModelData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data?.map((x) => x.toJson()) ?? []),
      };
}

class NotificationModelData {
  NotificationModelData({
    this.id,
    this.consultationId,
    this.title,
    this.message,
    this.date,
    this.time,
  });

  final int? id;
  final int? consultationId;
  final String? title;
  final String? message;
  final DateTime? date;
  final String? time;

  factory NotificationModelData.fromJson(Map<String, dynamic> json) =>
      NotificationModelData(
        id: json["id"],
        consultationId: json["consultation_id"],
        title: json["title"],
        message: json["message"],
        date: DateTime.parse(json["date"]),
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "consultation_id": consultationId,
        "title": title,
        "message": message,
        "date":
            "${date?.year.toString().padLeft(4, '0')}-${date?.month.toString().padLeft(2, '0')}-${date?.day.toString().padLeft(2, '0')}",
        "time": time,
      };
}
