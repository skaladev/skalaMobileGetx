// To parse this JSON data, do
//
//     final consultationCountModel = consultationCountModelFromJson(jsonString);

import 'dart:convert';

ConsultationCountModel consultationCountModelFromJson(String str) => ConsultationCountModel.fromJson(json.decode(str));

String consultationCountModelToJson(ConsultationCountModel data) => json.encode(data.toJson());

class ConsultationCountModel {
    ConsultationCountModel({
        this.message,
        this.data,
    });

    final String? message;
    final ConsultationCountModelData? data;

    factory ConsultationCountModel.fromJson(Map<String, dynamic> json) => ConsultationCountModel(
        message: json["message"],
        data: ConsultationCountModelData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": data?.toJson(),
    };
}

class ConsultationCountModelData {
   ConsultationCountModelData({
        this.unansweredConsultations,
        this.answeredConsultations,
    });

   final int? unansweredConsultations;
   final int? answeredConsultations;

    factory ConsultationCountModelData.fromJson(Map<String, dynamic> json) =>ConsultationCountModelData(
        unansweredConsultations: json["unanswered_consultations"],
        answeredConsultations: json["answered_consultations"],
    );

    Map<String, dynamic> toJson() => {
        "unanswered_consultations": unansweredConsultations,
        "answered_consultations": answeredConsultations,
    };
}
