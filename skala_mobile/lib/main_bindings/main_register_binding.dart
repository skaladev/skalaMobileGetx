
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:skala_mobile/main_controllers/main_register_controller.dart';

class MainRegisterBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(MainRegisterController());
  }
}