import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skala_mobile/main_bloc/konsultasi/kosultasi_state.dart';
import 'package:skala_mobile/main_services/main%20_konsultasi_service.dart';

class KonsultasiCubit extends Cubit<KonsultasiState> {
  final _konsultasiService = KonsultasiServices();

  KonsultasiCubit() : super(KonsultasiInitial());

  Future<void> getList() async {
    emit(KonsultasiFetch.loading());
    try {
      final res = await _konsultasiService.getList();
      print(res.toJson());
      if (res.message?.toLowerCase().contains('success') ?? false) {
        emit(KonsultasiFetch.success(data: res));
      }
    } catch (e, trace) {
      print(e);
      print(trace);
      emit(KonsultasiFetch.error(msg: 'Gagal'));
    }
  }

  Future<void> delete(String id) async {
    emit(KonsultasiDelete.loading());
    try {
      final res = await _konsultasiService.delete(id);
      if (res) {
        emit(KonsultasiDelete.success());
      }
    } catch (e, trace) {
      print(e);
      print(trace);
      emit(KonsultasiDelete.error(msg: 'Gagal'));
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

  Future<void> getDetail(String id) async {
    emit(KonsultasiDetailFetch.loading());
    try {
      final res = await _konsultasiService.getDetail(id);
      print(res.toJson());
      if (res.message?.toLowerCase().contains('success') ?? false) {
        emit(KonsultasiDetailFetch.success(data: res));
      }
    } catch (e, trace) {
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
      print(image);
      if (image != null) {
        final res = await _konsultasiService.createKonsultasi(
          categoryId: categoryId,
          title: title,
          description: description,
          image: image,
        );
        if (res) {
          emit(KonsultasiCreate.success());
        }
      } else {
        final res = await _konsultasiService.createKonsultasi(
          categoryId: categoryId,
          title: title,
          description: description,
        );
        if (res) {
          emit(KonsultasiCreate.success());
        }
      }
    } catch (e, trace) {
      print(e);
      print(trace);
      emit(KonsultasiCreate.error(msg: 'Gagal'));
    }
  }

  Future<void> ratingKonsultasi({
    int? consultationId,
    int? rating,
  })async{
    emit(KonsultasiRating.loading());
    try {
      final res = await _konsultasiService.giveRating(
        consultationId: consultationId,
        rating: rating
      );
      if(res){
        emit(KonsultasiRating.success());
      }
    } catch (e) {
      emit(KonsultasiRating.error(msg: 'Gagal'));
    }
  }
}
