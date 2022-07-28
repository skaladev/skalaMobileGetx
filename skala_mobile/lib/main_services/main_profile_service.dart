
import 'package:skala_mobile/main_helpers/main_dio_helper.dart';
import 'package:skala_mobile/main_models/main_profile_model.dart';

class ProfileServices{
  final _api = MainDioHelper().getDio();

  Future<ProfileModel> getProfile()async{
    final res = await _api.get('/users/me');
    return ProfileModel.fromJson(res.data);
  }
}