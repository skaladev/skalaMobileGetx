import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skala_mobile/main_bloc/consultations/consultation_state.dart';
import 'package:skala_mobile/main_services/main_consultation_service.dart';

class ConsultationCubit extends Cubit<ConsultationState> {
  final _consultationService = ConsultationServices();

  ConsultationCubit() : super(ConsultationInitial());

  //User
  Future<void> getCategories() async {
    emit(CategoriesFetch.loading());
    try {
      final res = await _consultationService.getConsultationCategories();
      print(res.toJson());
      if (res.message?.toLowerCase().contains('success') ?? false) {
        emit(CategoriesFetch.success(data: res));
      }
    } catch (e, trace) {
      print(e);
      print(trace);
      emit(CategoriesFetch.error(msg: 'Gagal'));
    }
  }

  Future<void> getConsultantList() async {
    emit(ConsultantListFetch.loading());
    try {
      final res = await _consultationService.getConsultantList();
      print(res.toJson());
      if (res.message?.toLowerCase().contains('success') ?? false) {
        emit(ConsultantListFetch.success(data: res));
      }
    } catch (e, trace) {
      print(e);
      print(trace);
      emit(ConsultantListFetch.error(msg: 'Gagal'));
    }
  }

  Future<void> getConsultant(String id) async {
    emit(ConsultantFetch.loading());
    try {
      final res = await _consultationService.getConsultant(id);
      print(res.toJson());
      if (res.message?.toLowerCase().contains('success') ?? false) {
        emit(ConsultantFetch.success(data: res));
      }
    } catch (e, trace) {
      print(e);
      print(trace);
      emit(ConsultantFetch.error(msg: 'Gagal'));
    }
  }

  Future<void> createConsultation({
    String? title,
    String? description,
    String? image,
    String? toUserId,
  }) async {
    emit(ConsultationCreate.loading());
    try {
      if (image != null) {
        final res = await _consultationService.createConsultation(
          title: title,
          description: description,
          image: image,
          toUserId: toUserId,
        );
        if (res) {
          emit(ConsultationCreate.success());
        }
      } else {
        final res = await _consultationService.createConsultation(
            title: title,
            description: description,
            toUserId: toUserId);
        print(res);
        if(res){
          emit(ConsultationCreate.success());
        }
      }
    } catch (e,trace) {
      print(e);
      print(trace);
      emit(ConsultationCreate.error(msg: 'Gagal'));
    }
  }

  Future<void> getConsultationList() async {
    emit(ConsultationFetch.loading());
    try {
      final res = await _consultationService.getConsultationList();
      print(res.toJson());
      if (res.message?.toLowerCase().contains('success') ?? false) {
        emit(ConsultationFetch.success(data: res));
      }
    } catch (e, trace) {
      print(e);
      print(trace);
      emit(ConsultationFetch.error(msg: 'Gagal'));
    }
  }

  Future<void> delete(String id)async{
    emit(ConsultationDelete.loading());
    try {
      final res= await _consultationService.delete(id);
      if(res){
        emit(ConsultationDelete.success());
      }
    } catch (e,trace) {
      print(e);
      print(trace);
      emit(ConsultationDelete.error(msg: 'Gagal'));
      
    }
  }

  Future<void> getDetailConsultation(String id) async{
    emit(ConsultationDetailFetch.loading());
    try {
      final res = await _consultationService.getConsultationDetail(id);
      print(res.toJson());
      if(res.message?.toLowerCase().contains('success')?? false){
        emit(ConsultationDetailFetch.success(data: res));
      }
    } catch (e,trace) {
      print(e);
      print(trace);
      emit(ConsultationDetailFetch.error(msg: 'Gagal'));
    }
  }
}
