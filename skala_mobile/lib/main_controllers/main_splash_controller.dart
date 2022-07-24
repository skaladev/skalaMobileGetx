import 'dart:async';

import 'package:get/get.dart';
import 'package:skala_mobile/main_commons/main_constant_route.dart';
import 'package:skala_mobile/main_prefs/prefs.dart';

class MainSplashController extends GetxController {
  final _prefs = Prefs();
  Future<Timer> loadData() async {
    return Timer(
      const Duration(seconds: 3),
      onDoneLoading,
    );
  }

  void onDoneLoading() {
    if (_prefs.isLogin) {
      Get.offAllNamed(MainConstantRoute.bottomNavigationBar);
      return;
    }
    print('_prefs.isWelcome : ${_prefs.isWelcome}');
    if (_prefs.isWelcome == true) {
      Get.offAllNamed(MainConstantRoute.mainLogin);
      return;
    }
    Get.offNamed(MainConstantRoute.mainWelcomeRoute);
  }

  @override
  void onInit() {
    loadData();
    super.onInit();
  }
}
