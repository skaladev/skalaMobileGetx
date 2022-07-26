
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skala_mobile/main_bloc/konsultasi/kosultasi_state.dart';
import 'package:skala_mobile/main_services/main%20_konsultasi_service.dart';

class KonsultasiCubit extends Cubit<KonsultasiState>{
  final _konsultasiService = KonsultasiServices();

  KonsultasiCubit() : super(KonsultasiInitial());

  Future<void> getList() async {
    emit(KonsultasiFetch.loading());
    try {
      final res = await _konsultasiService.getList();
      print(res.toJson());
      if(res.message?.toLowerCase().contains('success')??false){
        emit(KonsultasiFetch.success(data:res));
      }
    } catch (e, trace) {
      print(e);
      print(trace);
      emit(KonsultasiFetch.error(msg: 'Gagal'));
    }
  }

  Future<void> getKategori() async {
    emit(KategoriFetch.loading());
    try {
      final res = await _konsultasiService.getCategory();
      print(res.toJson());
      if (res.message?.toLowerCase().contains('success') ?? false) {
        emit(KategoriFetch.success(data: res));
      }
    } catch (e, trace) {
      print(e);
      print(trace);
      emit(KategoriFetch.error(msg: 'Gagal'));
    }
  }

  Future<void> getDetail(String id)async{
    emit(KonsultasiDetailFetch.loading());
    try {
      final res = await _konsultasiService.getDetail(id);
      print(res.toJson());
      if(res.message?.toLowerCase().contains('succes')??false){
        emit(KonsultasiDetailFetch.success(data:res));
      }
    } catch (e,trace) {
      print(e);
      print(trace);
      emit(KonsultasiDetailFetch.error(msg: 'Gagal'));
      
    }
  }

  Future<void> createKonsultasi({
    String? categoryId,
    String? title,
    String? description,
    String? image,
  }) async {
    emit(KonsultasiCreate.loading());
    try {
      final res = await _konsultasiService.createKonsultasi(
        categoryId: categoryId,
        title: title,
        description: description,
        image: image,
      );
      if(res){
        emit(KonsultasiCreate.success());
      }
    } catch (e,trace) {
      print(e);
      print(trace);
      emit(KonsultasiCreate.error(msg:'Gagal'));
    }
  }
}