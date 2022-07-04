import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skala_mobile/main_commons/main_constant_data.dart';
import 'package:skala_mobile/main_commons/main_constant_route.dart';

class MainLoginController extends GetxController {
  Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 3), onDoneLoading);
  }

  final loginFormKey = GlobalKey<FormState>();
  final noWhatshappController = TextEditingController();

  void onDoneLoading() {
    Get.offNamed(MainConstantRoute.mainLogin);
  }
  
  @override
  void onInit() {
    loadData();
    super.onInit();
    noWhatshappController.text;
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    noWhatshappController.dispose();
  }

  void login(){
    if(loginFormKey.currentState!.validate()){
      checkLogin(noWhatshappController.text).then((auth){
        if(auth){
          Get.toNamed(MainConstantData.verifyOtp);
           Get.snackbar('Login', 'Verifikasi Otp Telah dikirimkan');
        }else{
           Get.snackbar('Login', 'Login Gagal');
        }
      });
    }
  }
  
  Future<bool>checkLogin(String noWhatshapp){
    if(noWhatshapp == "085801482929"){
      return Future.value(true);
    }
    return Future.value(false);
  }
}
