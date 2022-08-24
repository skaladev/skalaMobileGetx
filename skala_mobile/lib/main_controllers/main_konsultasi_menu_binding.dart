import 'package:get/get.dart';
import 'dart:async';
import 'package:skala_mobile/main_commons/main_constant_route.dart';
class MainKonsultasiMenuController extends GetxController{
  Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 1), onDoneLoading);
  }

  void onDoneLoading() {
    Get.offNamed(MainConstantRoute.mainMenuKonsultasi);
  }

  @override
  void onInit() {
    loadData();
    super.onInit();
  }
}