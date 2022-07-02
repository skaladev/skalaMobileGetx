import 'package:get/get.dart';
import 'package:skala_mobile/main_controllers/main_login_controller.dart';


class MainLoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(MainLoginController());
  }
}
