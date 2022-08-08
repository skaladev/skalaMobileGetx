
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skala_mobile/main_bloc/consultations/consultation_state.dart';
import 'package:skala_mobile/main_services/main_consultation_service.dart';

class ConsultationCubit extends Cubit<ConsultationState>{
  final _consultationService = ConsultationServices();

  ConsultationCubit():super(ConsultationInitial());

  //User
  Future<void>getCategories()async{
    emit(CategoriesFetch.loading());
    try {
      final res = await _consultationService.getConsultationCategories();
      print(res.toJson());
      if(res.message?.toLowerCase().contains('success')?? false){
        emit(CategoriesFetch.success(data: res));
      }
    } catch (e,trace) {
      print(e);
      print(trace);
      emit(CategoriesFetch.error(msg: 'Gagal'));
    }
  }

  Future<void>getConsultantList()async{
    emit(ConsultantFetch.loading());
    try {
      final res = await _consultationService.getConsultantList();
      print(res.toJson());
      if(res.message?.toLowerCase().contains('success')?? false){
        emit(ConsultantFetch.success(data: res));
      }
    } catch (e,trace) {
      print(e);
      print(trace);
      emit(ConsultantFetch.error(msg: 'Gagal'));
    }
  }

}