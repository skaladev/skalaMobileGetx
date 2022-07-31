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
      if (res.message?.toLowerCase().contains('success') ?? false) {
        emit(KonsultasiFetch.success(data: res));
      }
    } catch (e) {
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
    } catch (e) {
      emit(KonsultasiDelete.error(msg: 'Gagal'));
    }
  }

  Future<void> getKategori() async {
    emit(KategoriFetch.loading());
    try {
      final res = await _konsultasiService.getCategory();
      if (res.message?.toLowerCase().contains('success') ?? false) {
        emit(KategoriFetch.success(data: res));
      }
    } catch (e) {
      emit(KategoriFetch.error(msg: 'Gagal'));
    }
  }

  Future<void> getDetail(String id) async {
    emit(KonsultasiDetailFetch.loading());
    try {
      final res = await _konsultasiService.getDetail(id);
      if (res.message?.toLowerCase().contains('succes') ?? false) {
        emit(KonsultasiDetailFetch.success(data: res));
      }
    } catch (e) {
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
    } catch (e) {
      emit(KonsultasiCreate.error(msg: 'Gagal'));
    }
  }

  Future<void> ratingKonsultasi({
    int? consultationId,
    int? rating,
  }) async {
    emit(KonsultasiCreate.loading());
    try {
      final res = await _konsultasiService.giveRating(
        consultationId: consultationId,
        rating: rating,
      );
      if (res) {
        emit(KonsultasiCreate.success());
      }
    } catch (e) {
      emit(KonsultasiCreate.error(msg: 'Gagal'));
    }
  }
}
