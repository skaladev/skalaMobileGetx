// To parse this JSON data, do
//
//     final konsultasiDetail = konsultasiDetailFromJson(jsonString);

import 'dart:convert';

KonsultasiDetail konsultasiDetailFromJson(String str) =>
    KonsultasiDetail.fromJson(json.decode(str));

String konsultasiDetailToJson(KonsultasiDetail data) =>
    json.encode(data.toJson());

class KonsultasiDetail {
  KonsultasiDetail({
    this.message,
    this.data,
  });

  final String? message;
  final List<KonsultasiDetailDataModel>? data;

  factory KonsultasiDetail.fromJson(Map<String, dynamic> json) =>
      KonsultasiDetail(
        message: json["message"],
        data: List<KonsultasiDetailDataModel>.from(
            json["data"].map((x) => KonsultasiDetailDataModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data?.map((x) => x.toJson()) ?? []),
      };
}

class KonsultasiDetailDataModel {
  KonsultasiDetailDataModel({
    this.id,
    this.title,
    this.description,
    this.date,
    this.time,
    this.fromUser,
  });

  final int? id;
  final String? title;
  final String? description;
  final DateTime? date;
  final String? time;
  final String? fromUser;

  factory KonsultasiDetailDataModel.fromJson(Map<String, dynamic> json) =>
      KonsultasiDetailDataModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        date: DateTime.parse(json["date"]),
        time: json["time"],
        fromUser: json["from_user"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "date":
            "${date?.year.toString().padLeft(4, '0')}-${date?.month.toString().padLeft(2, '0')}-${date?.day.toString().padLeft(2, '0')}",
        "time": time,
        "from_user": fromUser,
      };
}
