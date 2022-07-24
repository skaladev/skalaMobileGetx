import 'package:dio/dio.dart';
import 'package:skala_mobile/main_helpers/main_dio_helper.dart';
import 'package:skala_mobile/main_models/main_login_model.dart';
import 'package:skala_mobile/main_models/verify_otp_model.dart';

class MainAuthServices {
  final _api = MainDioHelper().getDio();

  Future<MainLoginModel> login({
    String? noHp,
  }) async {
    final res = await _api.post('/login',
      data: FormData.fromMap({
        'phone': noHp,
      }),
    );
    return MainLoginModel.fromJson(res.data);
  }

  Future<VerifyOtpModel> verifyOTP({
    String? code,
  })async {
    final res = await _api.post('/verify-otp',
      data: FormData.fromMap({'otp':code}),
    );
    return VerifyOtpModel.fromJson(res.data);
  }
}

