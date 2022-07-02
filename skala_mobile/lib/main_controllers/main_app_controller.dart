import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:skala_mobile/main_commons/main_text_data.dart';
import 'package:skala_mobile/main_helpers/main_show_pop_up_dialog_helper.dart';

class MainAppController extends GetxController {
  final Connectivity _connectivity = Connectivity();
  final MainShowPopUpDialogHelper _mainShowPopUpDialogHelper =
      MainShowPopUpDialogHelper();
  bool isAppLoading = false;
  int backButtonPressedCount = 0, _counter = 0;

  @override
  void onInit() {
    super.onInit();
    _connectivity.onConnectivityChanged.listen(
      (event) {
        if (event == ConnectivityResult.none) {
          _mainShowPopUpDialogHelper.showPopUpDialog(
            title: MainTextData.textWarning,
            content: MainTextData.textNoInternet,
            isWithButton: false,
            onConfirm: (){}
          );
        } else if (event == ConnectivityResult.mobile ||
            event == ConnectivityResult.wifi) {
          Get.back();
        }
      },
    );
  }

  void setIsAppLoading(bool isAppLoading) {
    this.isAppLoading = isAppLoading;
    update();
  }

  void startCountDownTimer() {
    const Duration _oneSec = Duration(seconds: 1);
    Timer.periodic(
      _oneSec,
      (Timer timer) {
        if (_counter == 10) {
          timer.cancel();
          _counter = 0;
          backButtonPressedCount = 0;
        } else {
          _counter++;
        }
      },
    );
  }
}
