

import 'package:get/instance_manager.dart';
import 'package:skala_mobile/main_controllers/main_verify_otp_controller.dart';

class MainVerifyOtpBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(MainVerifyOtpController());
  }
}