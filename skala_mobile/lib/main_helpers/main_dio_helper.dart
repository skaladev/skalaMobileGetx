import 'package:dio/dio.dart';
import 'package:get/get.dart' as getApp;
import 'package:skala_mobile/main_controllers/main_hive_controller.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:skala_mobile/main_prefs/prefs.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class MainDioHelper {
  factory MainDioHelper() {
    return _mainDioHelper;
  }

  MainDioHelper._internal();

  final _prefs = Prefs();
  static final MainDioHelper _mainDioHelper = MainDioHelper._internal();
  final MainHiveController _mainHiveController = getApp.Get.find<MainHiveController>();

  void _addDioLongger(Dio dio){
    _addDioLongger(Dio _dio){
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        compact: false
      );
    }
  }
  Dio getDio({bool isBaseUrl = true}) {
    final BaseOptions option = BaseOptions(
      // baseUrl: isBaseUrl ? dotenv.env['BASE_URL'].toString():'',
      baseUrl: 'https://m3119003.mhs.d3tiuns.com/api',
      connectTimeout: 30000,
      receiveTimeout: 30000,
      contentType: 'application/json',
      headers: {
        // if (_prefs.token?.isNotEmpty ?? false)
        'Authorization': 'Bearer ${_prefs.token}',
      },
    );

    final Dio _dio = Dio (option)..interceptors.add(_interceptor);;
    _addDioLongger(_dio);
    return _dio;
    
  }
}

final _interceptor = InterceptorsWrapper(
  onRequest: (RequestOptions options, handler) {
    String headers = '';
    options.headers.forEach((key, value) {
      headers += '| $key: $value';
    });
    print(
        '[DIO] Request: ${options.method} ${options.uri} | Data: ${options.data.toString()} | Headers:$headers');
    handler.next(options);
  },
  onResponse: (Response response, handler) async {
    print(
        '[DIO] Response [code ${response.statusCode}]: ${response.realUri} | ${response.data.toString()}');
    handler.next(response);
  },
  onError: (DioError error, handler) async {
    print(
        '[DIO] ${error.response?.realUri} | Error: ${error.error} | ${error.response?.toString()}');
    handler.next(error);
  },
);
