import 'dart:io';

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:skala_mobile/main_commons/main_constant_data.dart';
import 'package:skala_mobile/main_commons/main_constant_key.dart';

class MainHiveController extends GetxController {
  late Box _mainBox;

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    final Directory _directory = await getApplicationDocumentsDirectory();
    Hive.init(_directory.path);
    _mainBox = await Hive.openBox(MainConstantData.mainBox);
  }

  void onClearData() {
    _mainBox..delete(MainConstantKey.tokenKey);
    setIsLoggedIn(false);
  }

  void setIsLoggedIn(bool isLoggedIn) {
    _mainBox.put(MainConstantKey.isLoggedIn, isLoggedIn);
  }

  bool getIsLoggedIn() => _mainBox.get(MainConstantKey.isLoggedIn) as bool;

  String getToken() => _mainBox.get(MainConstantKey.tokenKey).toString();

}
