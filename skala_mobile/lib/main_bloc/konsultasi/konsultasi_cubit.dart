
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skala_mobile/main_bloc/konsultasi/kosultasi_state.dart';
import 'package:skala_mobile/main_services/main%20_konsultasi_service.dart';

class KonsultasiCubit extends Cubit<KonsultasiState>{
  final _konsultasiServices = KonsultasiServices();

  KonsultasiCubit() : super(KonsultasiInitial());

  Future<void> getList() async {
    emit(KonsultasiFetch.loading());
    try {
      final res = await _konsultasiServices.getList();
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
}