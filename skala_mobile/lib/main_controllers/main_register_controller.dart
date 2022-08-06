

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skala_mobile/main_commons/main_constant_route.dart';

class MainRegisterController extends GetxController{
   Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 3), onDoneLoading);
  }

  final registerFormKey = GlobalKey<FormState>();
  final noWhatshappController = TextEditingController();
  final namaLengkapController = TextEditingController();

  void onDoneLoading() {
     Get.offNamed(MainConstantRoute.mainRegister);
  }

  @override
  void onInit() {
    loadData();
    super.onInit();
    noWhatshappController.text;
    namaLengkapController.text;
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    noWhatshappController.dispose();
    namaLengkapController.dispose();
  }

  void register(){
    if(registerFormKey.currentState!.validate()){
      checkRegister(noWhatshappController.text, namaLengkapController.text).then((auth){
        if(auth){
          Get.toNamed(MainConstantRoute.verifyOtp);
          Get.snackbar('Register', 'Verifikasi Otp Telah dikirimkan');
        }else{
          Get.snackbar('Register', 'Register Gagal');
        }
      });
    }
  }

  Future<bool> checkRegister(String noWhatshapp, String namaLengkap){
    if(noWhatshapp == '085801482929' && namaLengkap == 'Fandy Irianto'){
      return Future.value(true);
    }
    return Future.value(false);
  }
}