import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skala_mobile/main_commons/main_constant_key.dart';
import 'package:skala_mobile/main_models/main_login_model.dart';
import 'package:skala_mobile/main_prefs/prefs.dart';
import 'package:skala_mobile/main_services/main_auth_services.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final _prefs = Prefs();
  final _authService = MainAuthServices();

  AuthCubit() : super(AuthInitial());

  Future<void> login({
    String? noHp,
  }) async {
    emit(AuthLogin.loading());
    try {
      final res = await _authService.login(noHp: noHp);
      if (res.message.toLowerCase().contains('success')) {
        _prefs.token = res.data.token;
        emit(AuthLogin.success(data: res));
      }
    } catch (e) {
      emit(AuthLogin.error(msg: 'Gagal'));
    }
  }

  Future<void> verifyOTP({
    String? code,
  }) async {
    emit(AuthVerifyOtp.loading());
    print(_prefs.token);
    try {
      final res = await _authService.verifyOTP(code: code);
      if (res.message?.toLowerCase().contains('success') ?? false) {
        if (res.data?.isActive == 1) {
          _prefs.isActive = true;
          _prefs.roleId = res.data?.roleId;
          emit(AuthVerifyOtp.success());
        }
      }
    } catch (e, trace) {
      print(e);
      print(trace);
      emit(AuthVerifyOtp.error(msg: 'Gagal'));
    }
  }

  Future<void> register({
    String? phone,
    String? name,
    String? gender,
    String? tanggalLahir,
  }) async {
    emit(AuthRegister.loading());
    try {
      final res = await _authService.register(
        phone: phone,
        name: name,
        gender: gender,
        tanggalLahir: tanggalLahir,
      );
      if (res) {
        emit(AuthRegister.success());
      }
    } catch (e, trace) {
      print(e);
      print(trace);
      emit(AuthRegister.error(msg: 'Gagal'));
    }
  }
}
