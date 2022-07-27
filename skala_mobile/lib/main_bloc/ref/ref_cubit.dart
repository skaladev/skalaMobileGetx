

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skala_mobile/main_commons/main_constant_key.dart';
import 'package:skala_mobile/main_models/main_ref_model.dart';
import 'package:skala_mobile/main_services/main_ref_services.dart';

part 'ref_state.dart';

class RefCubit extends Cubit<RefState>{
  final _refService = RefServices();

  RefCubit(): super(RefInitial());

  Future<void> getProvince()async{
    emit(ProvinceFetch.loading());
    try {
      final res = await _refService.getProvinces();
      print(res.toJson());
      if(res.message?.toLowerCase().contains('success')??false){
        emit(ProvinceFetch.success(data: res));
      }
    } catch (e,trace) {
      print(e);
      print(trace);
      emit(ProvinceFetch.error(msg: 'Gagal'));
    }
  }

  Future<void> getRegency(String idProvince)async{
    emit(RegencyFetch.loading());
    try {
      final res = await _refService.getRegencies(idProvince);
      print(res.toJson());
      if(res.message?.toLowerCase().contains('success')??false){
        emit(RegencyFetch.success(data:res));
      }
    } catch (e,trace) {
      print(e);
      print(trace);
      emit(RegencyFetch.error(msg: 'Gagal'));
    }
  }

  Future<void> getDistrict(String idRegency)async{
    emit(DistrictFetch.loading());
    try {
      final res = await _refService.getDistricts(idRegency);
      print(res.toJson());
      if(res.message?.toLowerCase().contains('success')??false){
        emit(DistrictFetch.success(data:res));
      }
    } catch (e,trace) {
      print(e);
      print(trace);
      emit(DistrictFetch.error(msg: 'Gagal'));
    }
  }

  Future<void> getSubDistrict(String idDistrict)async{
    emit(SubDistrictFetch.loading());
    try {
      final res = await _refService.getSubDistricts(idDistrict);
      print(res.toJson());
      if(res.message?.toLowerCase().contains('success')??false){
        emit(SubDistrictFetch.success(data:res));
      }
    } catch (e,trace) {
      print(e);
      print(trace);
      emit(SubDistrictFetch.error(msg: 'Gagal'));
    }
  }
}