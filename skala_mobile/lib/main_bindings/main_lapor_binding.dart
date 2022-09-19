import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/instance_manager.dart';
import 'package:skala_mobile/main_controllers/main_lapor_controller.dart';

class MainLaporBinding implements Bindings{
  @override
  void dependencies(){
    Get.put(MainLaporController());
  }
}