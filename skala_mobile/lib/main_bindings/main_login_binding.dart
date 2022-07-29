import 'package:get/get.dart';
import 'package:skala_mobile/main_controllers/main_hive_controller.dart';
import 'package:skala_mobile/main_controllers/main_login_controller.dart';
import 'package:skala_mobile/main_controllers/main_welcome_controller.dart';


class MainLoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(MainHiveController());
    Get.put(MainWelcomeController());
    Get.put(MainLoginController());
  }
}
