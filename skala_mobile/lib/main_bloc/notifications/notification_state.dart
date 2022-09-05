

import 'package:skala_mobile/main_commons/main_constant_key.dart';
import 'package:skala_mobile/main_models/main_notification_model.dart';

abstract class NotificationState{}

class NotificationInitial extends NotificationState {}

class NotificationFetch extends NotificationState {
  final LoadStatus ? load;
  final String? message;
  final NotificationModel? data;

  NotificationFetch({
    this.load,
    this.data,
    this.message
  });

  NotificationFetch.loading({
    String? msg
  }): this(
    load: LoadStatus.loading,
    message:msg
  );

  NotificationFetch.success({
    String? msg,
    NotificationModel? data,
  }): this(
    load : LoadStatus.success,
    message: msg,
    data: data,
  );

  NotificationFetch.error({required String msg}): this(
    load: LoadStatus.error,
    message:msg,
  );
}
