import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:skala_mobile/main_controllers/main_hive_controller.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:skala_mobile/main_prefs/prefs.dart';

class MainDioHelper {
  factory MainDioHelper() {
    return _mainDioHelper;
  }

  MainDioHelper._internal();

  final _prefs = Prefs();
  static final MainDioHelper _mainDioHelper = MainDioHelper._internal();
  final MainHiveController _mainHiveController = Get.find<MainHiveController>();

  Dio getDio({bool isBaseUrl = true}) {
    final BaseOptions option = BaseOptions(
      // baseUrl: isBaseUrl ? dotenv.env['BASE_URL'].toString():'',
      baseUrl: 'https://api-skala.herokuapp.com/api',
      connectTimeout: 30000,
      receiveTimeout: 30000,
      contentType: 'application/json',
      headers: {
        // if (_prefs.token?.isNotEmpty ?? false)
        'Authorization': 'Bearer ${_prefs.token}',
      },
    );

    return Dio(option);
  }
}
