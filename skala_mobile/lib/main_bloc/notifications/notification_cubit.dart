import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skala_mobile/main_bloc/notifications/notification_state.dart';
import 'package:skala_mobile/main_services/main_notification_services.dart';

class NotificationCubit extends Cubit<NotificationState>{
  final _notifivationService = NotificationServices();

  NotificationCubit() : super(NotificationInitial());

  Future<void> getListNotification()async{
    emit(NotificationFetch.loading());
    try {
      final res = await _notifivationService.getNotification();
      print(res.toJson());

      if(res.message?.toLowerCase().contains('success')?? false){
        emit(NotificationFetch.success(data: res));
      }
    } catch (e,trace) {
      print(e);
      print(trace);
      emit(NotificationFetch.error(msg: 'Gagal'));
    }
  }
}