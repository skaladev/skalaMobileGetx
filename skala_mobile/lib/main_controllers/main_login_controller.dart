import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skala_mobile/main_commons/main_constant_route.dart';
import 'package:skala_mobile/main_controllers/main_hive_controller.dart';
import 'package:skala_mobile/main_controllers/main_welcome_controller.dart';
import 'package:skala_mobile/main_helpers/main_check_connectivity_helper.dart';
import 'package:skala_mobile/main_models/main_login_model.dart';
import 'package:skala_mobile/main_services/main_api_services.dart';

class MainLoginController extends GetxController {
  final MainCheckConnectivityHelper _mainCheckConnectivityHelper =
      MainCheckConnectivityHelper();
  final MainHiveController _mainHiveController = Get.find<MainHiveController>();
  final MainWelcomeController _mainWelcomeController =
      Get.find<MainWelcomeController>();
  final MainApiService _mainApiService = MainApiService();
  final loginFormKey = GlobalKey<FormState>();
  final noWhatshapp = TextEditingController();
  late MainLoginModel mainLoginModel;

  Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 3), onDoneLoading);
  }

  void onDoneLoading() {
    Get.offNamed(MainConstantRoute.mainLogin);
  }

  @override
  void onInit() {
    loadData();
    super.onInit();
    noWhatshapp.text;
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    noWhatshapp.dispose();
  }

  void login() {
    _mainCheckConnectivityHelper.checkConnectivity().then((value) {
      if (loginFormKey.currentState!.validate()) {
        if (value) {
          final Map<String, dynamic> _body = {
            'phone': noWhatshapp.text,
          };
          _mainApiService.login(_body).then(
                (value) => {
                  if (value is MainLoginModel)
                    {
                      mainLoginModel = value,
                      _mainHiveController..setIsLoggedIn(true),
                      Get.offAndToNamed(MainConstantRoute.verifyOtp),
                      Get.snackbar('Login', 'Verifikasi Otp Telah dikirimkan')
                    }
                  else
                    {Get.snackbar('Login', 'Login Gagal')},
                },
              );
        }
      }
    });
  }
}
