// To parse this JSON data, do
//
//     final konsultasiModel = konsultasiModelFromJson(jsonString);

import 'dart:convert';

KonsultasiModel konsultasiModelFromJson(String str) =>
    KonsultasiModel.fromJson(json.decode(str));

String konsultasiModelToJson(KonsultasiModel data) =>
    json.encode(data.toJson());

class KonsultasiModel {
  KonsultasiModel({
    this.message,
    this.data,
  });

  final String? message;
  final List<KonsultasiModelData>? data;

  factory KonsultasiModel.fromJson(Map<String, dynamic> json) =>
      KonsultasiModel(
        message: json["message"],
        data: List<KonsultasiModelData>.from(
            json["data"].map((x) => KonsultasiModelData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data?.map((x) => x.toJson()) ?? []),
      };
}

class KonsultasiModelData {
  KonsultasiModelData({
    this.id,
    this.title,
    this.date,
    this.time,
    this.label,
    this.status,
  });

  final int? id;
  final String? title;
  final DateTime? date;
  final String? time;
  final String? label;
  final String? status;

  factory KonsultasiModelData.fromJson(Map<String, dynamic> json) =>
      KonsultasiModelData(
        id: json["id"],
        title: json["title"],
        date: DateTime.parse(json["date"]),
        time: json["time"],
        label: json["label"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "date":
            "${date?.year.toString().padLeft(4, '0')}-${date?.month.toString().padLeft(2, '0')}-${date?.day.toString().padLeft(2, '0')}",
        "time": time,
        "label": label,
        "status": status
      };
}
