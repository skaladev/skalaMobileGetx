import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/instance_manager.dart';
import 'package:skala_mobile/main_controllers/main_informasi_aduan_controller.dart';

class MainInfomasiAduanBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(MainInformasiAduanController());
  }
}
