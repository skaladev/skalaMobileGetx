import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:skala_mobile/main_helpers/main_dio_helper.dart';
import 'package:skala_mobile/main_models/main_login_model.dart';
import 'package:skala_mobile/main_models/verify_otp_model.dart';

class MainAuthServices {
  final _api = MainDioHelper().getDio();

  Future<MainLoginModel> login({
    String? noHp,
  }) async {
    final res = await _api.post(
      '/login',
      data: FormData.fromMap({
        'phone': noHp,
      }),
    );
    return MainLoginModel.fromJson(res.data);
  }

  Future<VerifyOtpModel> verifyOTP({
    String? code,
  }) async {
    String? token = await FirebaseMessaging.instance.getToken();
    print(token);
    final res = await _api.post(
      '/verify-otp',
      data: FormData.fromMap({
        'otp': code,
        'notification_token': token,
      }),
    );
    return VerifyOtpModel.fromJson(res.data);
  }

  Future<bool> register({
    String? phone,
    String? name,
    String? nik,
    String? gender,
    String? tanggalLahir,
  }) async {
    final res = await _api.post(
      '/register',
      data: FormData.fromMap({
        'phone': phone,
        'name': name,
        'nik':nik,
        'gender': gender,
        'date_of_birth': tanggalLahir,
      }),
    );
    return res.data?['message'] == 'Success';
  }
}
