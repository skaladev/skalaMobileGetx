import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/instance_manager.dart';
import 'package:skala_mobile/main_routes/Pages/KonsultasiPraktisiPage/main_konsultasi_praktisi_bio.dart';
import 'package:skala_mobile/main_routes/Pages/KonsultasiPraktisiPage/main_konsultasi_praktisi_form_page.dart';

class MainKosultasiPraktisiFormBinding implements Bindings{
  @override
  void dependencies(){
    Get.put(MainKonsultasiPraktisiForm());
  }
}