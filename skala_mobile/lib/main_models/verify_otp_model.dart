// To parse this JSON data, do
//
//     final verifyOtpModel = verifyOtpModelFromJson(jsonString);

import 'dart:convert';

VerifyOtpModel verifyOtpModelFromJson(String str) =>
    VerifyOtpModel.fromJson(json.decode(str));

String verifyOtpModelToJson(VerifyOtpModel data) => json.encode(data.toJson());

class VerifyOtpModel {
  VerifyOtpModel({
    this.message,
    this.data,
  });

  final String? message;
  final VerifyOtpModelData? data;

  factory VerifyOtpModel.fromJson(Map<String, dynamic> json) => VerifyOtpModel(
        message: json["message"],
        data: VerifyOtpModelData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data?.toJson(),
      };
}

class VerifyOtpModelData {
  VerifyOtpModelData({
    this.id,
    this.roleId,
    this.name,
    this.gender,
    this.dateOfBirth,
    this.nik,
    this.phone,
    this.email,
    this.provinceId,
    this.regencyId,
    this.districtId,
    this.subDistrictId,
    this.profession,
    this.isActive,
    this.otp,
    this.otpCreatedAt,
    this.createdAt,
    this.updatedAt,
    this.imagePath,
  });

  final int? id;
  final int? roleId;
  final String? name;
  final String? gender;
  final DateTime? dateOfBirth;
  final String? nik;
  final String? phone;
  final String? email;
  final int? provinceId;
  final int? regencyId;
  final int? districtId;
  final int? subDistrictId;
  final String? profession;
  final int? isActive;
  final int? otp;
  final DateTime? otpCreatedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? imagePath;

  factory VerifyOtpModelData.fromJson(Map<String, dynamic> json) =>
      VerifyOtpModelData(
        id: json["id"],
        roleId: json["role_id"],
        name: json["name"],
        gender: json["gender"],
        dateOfBirth: DateTime.parse(json["date_of_birth"]),
        nik: json["nik"],
        phone: json["phone"],
        email: json["email"],
        provinceId: json["province_id"],
        regencyId: json["regency_id"],
        districtId: json["district_id"],
        subDistrictId: json["sub_district_id"],
        profession: json["profession"],
        isActive: json["is_active"],
        otp: json["otp"],
        otpCreatedAt: DateTime.parse(json["otp_created_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        imagePath: json["image_path"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "role_id": roleId,
        "name": name,
        "gender": gender,
        "date_of_birth":
            "${dateOfBirth?.year.toString().padLeft(4, '0')}-${dateOfBirth?.month.toString().padLeft(2, '0')}-${dateOfBirth?.day.toString().padLeft(2, '0')}",
        "nik": nik,
        "phone": phone,
        "email": email,
        "province_id": provinceId,
        "regency_id": regencyId,
        "district_id": districtId,
        "sub_district_id": subDistrictId,
        "profession": profession,
        "is_active": isActive,
        "otp": otp,
        "otp_created_at": otpCreatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "image_path": imagePath,
      };
}
