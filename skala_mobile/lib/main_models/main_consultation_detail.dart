// To parse this JSON data, do
//
//     final consultationDetailModel = consultationDetailModelFromJson(jsonString);

import 'dart:convert';

ConsultationDetailModel consultationDetailModelFromJson(String str) =>
    ConsultationDetailModel.fromJson(json.decode(str));

String consultationDetailModelToJson(ConsultationDetailModel data) =>
    json.encode(data.toJson());

class ConsultationDetailModel {
  ConsultationDetailModel({
    this.message,
    this.data,
  });

  final String? message;
  final Data? data;

  factory ConsultationDetailModel.fromJson(Map<String, dynamic> json) =>
      ConsultationDetailModel(
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  Data({
    this.user,
    this.consultations,
  });

  User? user;
  List<Consultation>? consultations;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: User.fromJson(json["user"]),
        consultations: List<Consultation>.from(
            json["consultations"].map((x) => Consultation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
        "consultations":
            List<dynamic>.from(consultations?.map((x) => x.toJson()) ?? []),
      };
}

class Consultation {
  Consultation({
    this.id,
    this.title,
    this.description,
    this.date,
    this.time,
    this.fromUser,
    this.imagePath,
  });

  final int? id;
  final String? title;
  final String? description;
  final DateTime? date;
  final String? time;
  final String? fromUser;
  dynamic imagePath;

  factory Consultation.fromJson(Map<String, dynamic> json) => Consultation(
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
        "date":
            "${date?.year.toString().padLeft(4, '0')}-${date?.month.toString().padLeft(2, '0')}-${date?.day.toString().padLeft(2, '0')}",
        "time": time,
        "from_user": fromUser,
        "image_path": imagePath,
      };
}

class User {
  User({
    this.id,
    this.name,
    this.category,
    this.workExperienceTimes,
    this.imagePath,
  });

  final int? id;
  final String? name;
  final String? category;
  final int? workExperienceTimes;
  final String? imagePath;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        category: json["category"],
        workExperienceTimes: json["work_experience_times"],
        imagePath: json["image_path"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "category": category,
        "work_experience_times": workExperienceTimes,
        "image_path": imagePath,
      };
}
