// To parse this JSON data, do
//
//     final consultationListUserModel = consultationListUserModelFromJson(jsonString);

import 'dart:convert';

ConsultationListUserModel consultationListUserModelFromJson(String str) => ConsultationListUserModel.fromJson(json.decode(str));

String consultationListUserModelToJson(ConsultationListUserModel data) => json.encode(data.toJson());

class ConsultationListUserModel {
    ConsultationListUserModel({
        this.message,
        this.data,
    });

   final String? message;
   final List<ConsultationListUserModelData>? data;

    factory ConsultationListUserModel.fromJson(Map<String, dynamic> json) => ConsultationListUserModel(
        message: json["message"],
        data: List<ConsultationListUserModelData>.from(json["data"].map((x) => ConsultationListUserModelData.fromJson(x))),
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
        this.title,
        this.category,
        this.date,
        this.time,
    });

   final int? id;
   final String? user;
   final String? profession;
   final String? title;
   final String? category;
   final DateTime? date;
   final String? time;

    factory ConsultationListUserModelData.fromJson(Map<String, dynamic> json) => ConsultationListUserModelData(
        id: json["id"],
        user: json["user"],
        profession: json["profession"],
        title: json["title"],
        category: json["category"],
        date: DateTime.parse(json["date"]),
        time: json["time"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user": user,
        "profession": profession,
        "title": title,
        "category": category,
        "date": "${date?.year.toString().padLeft(4, '0')}-${date?.month.toString().padLeft(2, '0')}-${date?.day.toString().padLeft(2, '0')}",
        "time": time,
    };
}
