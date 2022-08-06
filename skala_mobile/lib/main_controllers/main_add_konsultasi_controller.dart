import 'package:get/get.dart';
import 'dart:async';
import 'package:skala_mobile/main_commons/main_constant_route.dart';
class MainAddKonsultasiController extends GetxController{
  Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 3), onDoneLoading);
  }

  void onDoneLoading() {
    Get.offNamed(MainConstantRoute.mainAddKonsultasi);
  }

  @override
  void onInit() {
    loadData();
    super.onInit();
  }
}