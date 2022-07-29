


import 'package:skala_mobile/main_helpers/main_dio_helper.dart';
import 'package:skala_mobile/main_models/main_ref_model.dart';

class RefServices {
  final _api = MainDioHelper().getDio();

  Future<RefModel> getProvinces()async{
    final res = await _api.get('/provinces');
    return RefModel.fromJson(res.data);
  }

  Future<RefModel> getRegencies(idProvince)async{
    final res = await _api.get('/provinces/$idProvince/regencies');
    return RefModel.fromJson(res.data);
  }

  Future<RefModel> getDistricts(idRegency)async{
    final res = await _api.get('/regencies/$idRegency/districts');
    return RefModel.fromJson(res.data);
  }

  Future<RefModel> getSubDistricts(idDistrict)async{
    final res = await _api.get('/districts/$idDistrict/subdistricts');
    return RefModel.fromJson(res.data);
  }
}