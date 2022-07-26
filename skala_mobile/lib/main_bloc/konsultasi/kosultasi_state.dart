

import 'package:skala_mobile/main_commons/main_constant_key.dart';
import 'package:skala_mobile/main_models/main_kategori_model.dart';
import 'package:skala_mobile/main_models/main_konsultasi_detail_model.dart';
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


class KategoriFetch extends KonsultasiState {
  final LoadStatus? load;
  final String? message;
  final KategoriModel? data;

  KategoriFetch({
    this.load,
    this.message,
    this.data,
  });

  KategoriFetch.loading({
    String? msg,
  }) : this(
          load: LoadStatus.loading,
          message: msg,
        );

  KategoriFetch.success({
    String? msg,
    KategoriModel? data,
  }) : this(
          load: LoadStatus.success,
          message: msg,
          data: data,
        );

  KategoriFetch.error({required String msg})
      : this(
          load: LoadStatus.error,
          message: msg,
        );
}

class KonsultasiCreate extends KonsultasiState {
  final LoadStatus? load;
  final String? message;

  KonsultasiCreate({
    this.load,
    this.message,
  });

  KonsultasiCreate.loading({
    String? msg,
  }) : this(
          load: LoadStatus.loading,
          message: msg,
        );

  KonsultasiCreate.success({
    String? msg,
    KategoriModel? data,
  }) : this(
          load: LoadStatus.success,
          message: msg,
        );

  KonsultasiCreate.error({required String msg})
      : this(
          load: LoadStatus.error,
          message: msg,
        );
}

class KonsultasiDetailFetch extends KonsultasiState {
  final LoadStatus? load;
  final String? message;
  final KonsultasiDetail? data;

  KonsultasiDetailFetch({
    this.load,
    this.message,
    this.data,
  });

  KonsultasiDetailFetch.loading({
    String? msg,
  }) : this(
          load: LoadStatus.loading,
          message: msg,
        );

  KonsultasiDetailFetch.success({
    String? msg,
    KonsultasiDetail? data,
  }) : this(
          load: LoadStatus.success,
          message: msg,
          data: data,
        );

  KonsultasiDetailFetch.error({required String msg})
      : this(
          load: LoadStatus.error,
          message: msg,
        );
}