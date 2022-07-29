// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonStrin?g);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  ProfileModel({
    this.message,
    this.data,
  });

  final String? message;
  final Data? data;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
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
    this.nik,
    this.gender,
    this.dateOfBirth,
    this.phone,
    this.district,
    this.regency,
    this.profession,
  });

  final int? id;
  final String? name;
  final String? nik;
  final String? gender;
  final String? dateOfBirth;
  final String? phone;
  final String? district;
  final String? regency;
  final String? profession;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        nik: json["nik"],
        gender: json["gender"],
        dateOfBirth: json["date_of_birth"],
        phone: json["phone"],
        district: json["district"],
        regency: json["regency"],
        profession: json["profession"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "nik": nik,
        "gender": gender,
        "date_of_birth": dateOfBirth,
        "phone": phone,
        "district": district,
        "regency": regency,
        "profession": profession,
      };
}