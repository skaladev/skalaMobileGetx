

import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/instance_manager.dart';
import 'package:skala_mobile/main_controllers/main_edit_profile_controller.dart';

class MainEditProfileBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(MainEditProfileController());
  }
}