part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLogin extends AuthState {
  final LoadStatus? load;
  final String? message;
  final MainLoginModel? data;

  AuthLogin({
    this.load,
    this.message,
    this.data,
  });

  AuthLogin.loading({
    String? msg,
  }) : this(
          load: LoadStatus.loading,
          message: msg,
        );

  AuthLogin.success({
    String? msg,
    MainLoginModel? data,
  }) : this(
          load: LoadStatus.success,
          message: msg,
          data: data,
        );

  AuthLogin.error({required String msg})
      : this(
          load: LoadStatus.error,
          message: msg,
        );
}

class AuthVerifyOtp extends AuthState {
  final LoadStatus? load;
  final String? message;

  AuthVerifyOtp({
    this.load,
    this.message,
  });

  AuthVerifyOtp.loading({
    String? msg,
  }) : this(
          load: LoadStatus.loading,
          message: msg,
        );

  AuthVerifyOtp.success({
    String? msg,
  }) : this(
          load: LoadStatus.success,
          message: msg,
        );

  AuthVerifyOtp.error({required String msg})
      : this(
          load: LoadStatus.error,
          message: msg,
        );
}
