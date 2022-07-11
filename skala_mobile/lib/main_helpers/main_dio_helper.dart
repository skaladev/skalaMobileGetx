


import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:skala_mobile/main_controllers/main_hive_controller.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MainDioHelper {
  factory MainDioHelper(){
    return _mainDioHelper;
  }

  MainDioHelper._internal();

  static final MainDioHelper _mainDioHelper = MainDioHelper._internal();

  final MainHiveController _mainHiveController = Get.find<MainHiveController>();

  Dio getDio({bool isBaseUrl = true}){
    final BaseOptions _option= BaseOptions(
      baseUrl: isBaseUrl ? dotenv.env['BASE_URL'].toString():'',
      connectTimeout: 30000,
      receiveTimeout: 30000,
      contentType: 'application/json',
      headers :{
        'Authorization':_mainHiveController.getToken(),
      }
    );

  final Dio _dio = Dio (_option);
  return _dio;
  }
}