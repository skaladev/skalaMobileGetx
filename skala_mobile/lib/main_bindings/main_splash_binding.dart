import 'package:get/get.dart';
import 'package:skala_mobile/main_controllers/main_splash_controller.dart';


class MainSplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(MainSplashController());
  }
}
