
import 'package:get/instance_manager.dart';
import 'package:skala_mobile/main_controllers/main_app_controller.dart';
import 'package:skala_mobile/main_controllers/main_bottom_navigation_controller.dart';
import 'package:skala_mobile/main_controllers/main_hive_controller.dart';

class MainButtomNavigationBinding extends Bindings{
 @override
  void dependencies(){
     Get.put(MainAppController());
      Get.lazyPut(() => MainHiveController());
     Get.put(MainBottomNavigationController());
  }
}