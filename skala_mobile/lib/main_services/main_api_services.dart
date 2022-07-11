

import 'package:dio/dio.dart';
import 'package:skala_mobile/main_commons/main_constant_api.dart';
import 'package:skala_mobile/main_commons/main_constant_data.dart';
import 'package:skala_mobile/main_helpers/main_dio_helper.dart';
import 'package:skala_mobile/main_models/main_login_model.dart';

final MainDioHelper _mainDioHelper = MainDioHelper();

class MainApiService{
  factory MainApiService(){
    return _mainApiService;
  }

  MainApiService._internal();

  static final MainApiService _mainApiService= MainApiService._internal();

  Future<dynamic> login(Map<String,dynamic>body)async{
    try {
      final response = await _mainDioHelper.getDio().post(
        MainConstantApi.loginUrl,
        data:body,
      );
      if(response.statusCode == 200){
        final MainLoginModel _result = MainLoginModel.fromJson(response.data as Map<String,dynamic>);
        if(_result.message == 'Success'){
          return _result;
        }else{
          return _result.message;
        }
      }
    } on DioError catch (e) {
       return MainConstantData.somethingWentWrong;
    }
  }
}