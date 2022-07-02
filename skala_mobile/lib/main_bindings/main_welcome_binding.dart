

import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/instance_manager.dart';
import 'package:skala_mobile/main_controllers/main_welcome_controller.dart';
class MainWelcomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainWelcomeController());
  }
}
