import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/instance_manager.dart';
import 'package:skala_mobile/main_controllers/main_aspirasi_controller.dart';

class MainMenuAspirasiBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(MainMenuAspirasiController());
  }
}
