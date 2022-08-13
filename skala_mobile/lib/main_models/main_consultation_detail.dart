// To parse this JSON data, do
//
//     final consultationDetailModel = consultationDetailModelFromJson(jsonString);

import 'dart:convert';

ConsultationDetailModel consultationDetailModelFromJson(String str) => ConsultationDetailModel.fromJson(json.decode(str));

String consultationDetailModelToJson(ConsultationDetailModel data) => json.encode(data.toJson());

class ConsultationDetailModel {
    ConsultationDetailModel({
        this.message,
        this.data,
    });

    String? message;
    List<ConsultationDetailDataModel>? data;

    factory ConsultationDetailModel.fromJson(Map<String, dynamic> json) => ConsultationDetailModel(
        message: json["message"],
        data: List<ConsultationDetailDataModel>.from(json["data"].map((x) => ConsultationDetailDataModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data?.map((x) => x.toJson()) ?? []),
    };
}

class ConsultationDetailDataModel {
    ConsultationDetailDataModel({
        this.id,
        this.title,
        this.description,
        this.date,
        this.time,
        this.fromUser,
        this.imagePath,
    });

    int? id;
    String? title;
    String? description;
    DateTime? date;
    String? time;
    String? fromUser;
    dynamic? imagePath;

    factory ConsultationDetailDataModel.fromJson(Map<String, dynamic> json) => ConsultationDetailDataModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        date: DateTime.parse(json["date"]),
        time: json["time"],
        fromUser: json["from_user"],
        imagePath: json["image_path"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "date": "${date?.year.toString().padLeft(4, '0')}-${date?.month.toString().padLeft(2, '0')}-${date?.day.toString().padLeft(2, '0')}",
        "time": time,
        "from_user": fromUser,
        "image_path": imagePath,
    };
}
