
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
}