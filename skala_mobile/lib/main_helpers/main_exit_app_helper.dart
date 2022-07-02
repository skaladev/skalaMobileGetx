

import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:skala_mobile/main_commons/main_color_data.dart';
import 'package:skala_mobile/main_commons/main_size_data.dart';
import 'package:skala_mobile/main_commons/main_text_data.dart';
import 'package:skala_mobile/main_controllers/main_app_controller.dart';

class MainExitAppHelper {
  factory MainExitAppHelper() {
    return _mainExitAppHelper;
  }

  MainExitAppHelper._internal();

  static final MainExitAppHelper _mainExitAppHelper =
      MainExitAppHelper._internal();

  bool exitApp(MainAppController mainAppController) {
    if (mainAppController.backButtonPressedCount != 1) {
      mainAppController.backButtonPressedCount++;
      mainAppController.startCountDownTimer();
      Fluttertoast.showToast(
        msg: MainTextData.textExitApp,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: MainColorData.black.withOpacity(0.5),
        textColor: MainColorData.primaryLight,
        fontSize: MainSizeData.fontSize16,
      );
    } else {
      mainAppController.backButtonPressedCount = 0;
      Fluttertoast.cancel();
      exit(0);
    }
    return false;
  }
}
