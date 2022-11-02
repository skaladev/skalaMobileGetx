// To parse this JSON data, do
//
//     final consultantModel = consultantModelFromJson(jsonString);

import 'dart:convert';

ConsultantModel consultantModelFromJson(String str) =>
    ConsultantModel.fromJson(json.decode(str));

String consultantModelToJson(ConsultantModel data) =>
    json.encode(data.toJson());

class ConsultantModel {
  ConsultantModel({
    this.message,
    this.data,
  });

  final String? message;
  final Data? data;

  factory ConsultantModel.fromJson(Map<String, dynamic> json) =>
      ConsultantModel(
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
    this.id,
    this.name,
    this.consultantCategory,
    this.workExperienceTimes,
    this.skNumber,
    this.isActive,
    this.imagePath,
    this.description,
    this.specialities,
    this.placeOfPractice,
    this.graduateUniversity,
    this.graduateFaculty,
    this.graduateYear,
    this.experiences,
    this.notification_token,
  });

  final int? id;
  final String? name;
  final String? consultantCategory;
  final int? workExperienceTimes;
  final String? skNumber;
  final int? isActive;
  final dynamic imagePath;
  final String? description;
  final String? specialities;
  final String? placeOfPractice;
  final String? graduateUniversity;
  final String? graduateFaculty;
  final String? graduateYear;
  final List<dynamic>? experiences;
  final String? notification_token;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        consultantCategory: json["consultant_category"],
        workExperienceTimes: json["work_experience_times"],
        skNumber: json["sk_number"],
        isActive: json["is_active"],
        imagePath: json["image_path"],
        description: json["description"],
        specialities: json["specialities"],
        placeOfPractice: json["place_of_practice"],
        graduateUniversity: json["graduate_university"],
        graduateFaculty: json["graduate_faculty"],
        graduateYear: json["graduate_year"],
        experiences: List<dynamic>.from(json["experiences"].map((x) => x)),
        notification_token: json["notification_token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "consultant_category": consultantCategory,
        "work_experience_times": workExperienceTimes,
        "sk_number": skNumber,
        "is_active": isActive,
        "image_path": imagePath,
        "description": description,
        "specialities": specialities,
        "place_of_practice": placeOfPractice,
        "graduate_university": graduateUniversity,
        "graduate_faculty": graduateFaculty,
        "graduate_year": graduateYear,
        "experiences": List<dynamic>.from(experiences?.map((x) => x.toString()) ?? []),
        "notification_token":notification_token,
      };
}
