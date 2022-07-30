import 'package:dio/dio.dart';
import 'package:skala_mobile/main_helpers/main_dio_helper.dart';
import 'package:skala_mobile/main_models/main_profile_model.dart';

class ProfileServices {
  final _api = MainDioHelper().getDio();

  Future<ProfileModel> getProfile() async {
    final res = await _api.get('/users/me');
    return ProfileModel.fromJson(res.data);
  }

  Future<bool> updateProfile({
    String? id,
    String? name,
    String? nik,
    String? gender,
    String? tanggalLahir,
    String? regency,
    String? district,
    String? subDistrict,
    String? profession,
    String? image,
  }) async {
    final data = {
      'name': name,
      'nik' : nik,
      'gender': gender,
      'date_of_birth': tanggalLahir,
      'regency_id': regency,
      'district_id': district,
      'sub_district_id': subDistrict,
      'profession': profession,
      // if(image?.isNotEmpty ??false)
      // 'image':await MultipartFile.fromFile(image!)
    };
    print(data);
    final res = await _api.post(
      '/users/$id',
      data: data,
    );
    return res.data?['message'] == 'Success';
  }
}
