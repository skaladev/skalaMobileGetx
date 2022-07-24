

import 'package:skala_mobile/main_commons/main_constant_key.dart';
import 'package:skala_mobile/main_models/main_konsultasi_model.dart';

abstract class KonsultasiState {}

class KonsultasiInitial extends KonsultasiState {}

class KonsultasiFetch extends KonsultasiState {
  final LoadStatus? load;
  final String? message;
  final KonsultasiModel? data;

  KonsultasiFetch({
    this.load,
    this.message,
    this.data,
  });

  KonsultasiFetch.loading({
    String? msg,
  }) : this(
          load: LoadStatus.loading,
          message: msg,
        );

  KonsultasiFetch.success({
    String? msg,
    KonsultasiModel? data,
  }) : this(
          load: LoadStatus.success,
          message: msg,
          data: data,
        );

  KonsultasiFetch.error({required String msg})
      : this(
          load: LoadStatus.error,
          message: msg,
        );
}
