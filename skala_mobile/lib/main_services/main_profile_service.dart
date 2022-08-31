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
    String? profession_company,
    String? profession_start_year,
    String? profession_end_year
  }) async {
    final data = {
      if(name?.isNotEmpty ??false)
      'name': name,
       if(nik?.isNotEmpty ??false)
      'nik' : nik,
       if(gender?.isNotEmpty ??false)
      'gender': gender,
       if(tanggalLahir?.isNotEmpty ??false)
      'date_of_birth': tanggalLahir,
       if(regency?.isNotEmpty ??false)
      'regency_id': regency,
       if(district?.isNotEmpty ??false)
      'district_id': district,
       if(subDistrict?.isNotEmpty ??false)
      'sub_district_id': subDistrict,
       if(profession?.isNotEmpty ??false)
      'profession': profession,
      if(profession_company?.isNotEmpty ?? false)
      'profession_company': profession_company,
      if(profession_start_year?.isNotEmpty ?? false)
      'profession_start_year':profession_start_year,
      if(profession_end_year?.isNotEmpty ?? false)
      'profession_end_year':profession_end_year,
      // if(image?.isNotEmpty ??false)
      // 'image':await MultipartFile.fromFile(image!)
    };
    print(data);
    final url = "/users/$id";
    print(url);
    final res = await _api.post(
      '/users/$id',
      data: data,
    );
    print(res);
    return res.data?['message'] == 'Success';
  }
}
