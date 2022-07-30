
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skala_mobile/main_commons/main_constant_key.dart';
import 'package:skala_mobile/main_models/main_profile_model.dart';
import 'package:skala_mobile/main_services/main_profile_service.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState>{
  final _profileService = ProfileServices();

  ProfileCubit(): super(ProfileInitial());

  Future<void> getProfile()async{
    emit(ProfileFetch.loading());
    try {
      final res = await _profileService.getProfile();
      print(res.toJson());
      if(res.message?.toLowerCase().contains('success')?? false){
        emit(ProfileFetch.success(data: res));
      }
    } catch (e,trace) {
      print(e);
      print(trace);
      emit(ProfileFetch.error(msg: 'Gagal'));
    }
  }

  Future<void> updateProfile({
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
    emit(ProfileUpdate.loading());
    try {
      final res = await _profileService.updateProfile(
        id: id,
        name: name,
        nik: nik,
        gender: gender,
        tanggalLahir: tanggalLahir,
        regency: regency,
        district:district,
        subDistrict: subDistrict,
        profession: profession,
        // image: image
      );
      if(res){
        emit(ProfileUpdate.success());
      }
    } catch (e,trace) {
      print(e);
      print(trace);
      emit(ProfileUpdate.error(msg: 'Gagal'));
    }
  }
}