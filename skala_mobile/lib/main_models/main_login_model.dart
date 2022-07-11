import 'dart:convert';

MainLoginModel mainLoginModelFromJson(String str) => MainLoginModel.fromJson(json.decode(str));

String mainLoginModelToJson(MainLoginModel data) => json.encode(data.toJson());

class MainLoginModel {
    MainLoginModel({
        required this.message,
        required this.data,
    });

    String message;
    Data data;

    factory MainLoginModel.fromJson(Map<String, dynamic> json) => MainLoginModel(
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    Data({
        required this.message,
        required this.token,
    });

    String message;
    String token;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        message: json["message"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "token": token,
    };
}
