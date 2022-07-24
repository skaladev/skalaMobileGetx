import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:skala_mobile/main_commons/main_constant_key.dart';

void blocHelperListenner({
  required LoadStatus? load,
  String? message,
  void Function()? onSuccess,
}) {
  switch (load) {
    case LoadStatus.loading:
      EasyLoading.show(status: 'Loading...');
      break;
    case LoadStatus.success:
      EasyLoading.showSuccess(
        message ?? 'Berhasil',
      );
      if (onSuccess != null) onSuccess();
      break;
    case LoadStatus.error:
      EasyLoading.showError(
        message ?? 'Gagal',
      );
      break;
    default:
      break;
  }
}
