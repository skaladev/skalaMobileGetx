import 'dart:async';

import 'package:get/get.dart';
import 'package:skala_mobile/main_commons/main_constant_data.dart';
import 'package:skala_mobile/main_commons/main_constant_route.dart';

class MainLoginController extends GetxController{
   Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 3), onDoneLoading);
  }

  void onDoneLoading() {
     Get.offNamed(MainConstantRoute.mainLogin);
  }
  
  bool login(String noWhatshapp){
    if(noWhatshapp == "085801482929"){
      return true;
    }
    return false;
  }

  @override
  void onInit() {
    loadData();
    super.onInit();
  }
}