import 'package:get/instance_manager.dart';
import 'package:skala_mobile/main_controllers/main_add_konsultasi_controller.dart';
import 'package:skala_mobile/main_controllers/main_app_controller.dart';
import 'package:skala_mobile/main_controllers/main_hive_controller.dart';
import 'package:skala_mobile/main_controllers/main_login_controller.dart';
import 'package:skala_mobile/main_controllers/main_verify_otp_controller.dart';
import 'package:skala_mobile/main_controllers/main_welcome_controller.dart';

class MainInitialBinding implements Bindings {
  @override
  void dependencies() {
    // Get.put(MainHiveController(), permanent: true);
    // Get.put(MainAppController(), permanent: true);
    // Get.put(MainLoginController(), permanent: true);
    // Get.put(MainWelcomeController(), permanent: true);

    Get.lazyPut(() => MainHiveController());
    Get.lazyPut(() => MainAppController());
    Get.lazyPut(() => MainLoginController());
    Get.lazyPut(() => MainWelcomeController());
  }
}
