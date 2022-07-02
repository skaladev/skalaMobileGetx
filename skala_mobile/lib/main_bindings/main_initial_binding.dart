

import 'package:get/instance_manager.dart';
import 'package:skala_mobile/main_controllers/main_app_controller.dart';

class MainInitialBinding implements Bindings {
  @override
  void dependencies() {
    // Get.put(MainHiveController(), permanent: true);
    Get.put(MainAppController(), permanent: true);
  }
}
