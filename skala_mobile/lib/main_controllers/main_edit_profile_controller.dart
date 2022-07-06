import 'dart:async';

import 'package:get/get.dart';
import 'package:skala_mobile/main_commons/main_constant_route.dart';
class MainEditProfileController extends GetxController {
  Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 3), onDoneLoading);
  }

  void onDoneLoading() {
    Get.offNamed(MainConstantRoute.mainEditProfile);
  }

  @override
  void onInit() {
    loadData();
    super.onInit();
  }
}
