import 'package:dio/dio.dart';
import 'package:skala_mobile/main_helpers/main_dio_helper.dart';
import 'package:skala_mobile/main_models/main_notification_model.dart';

class NotificationServices {
  final _api = MainDioHelper().getDio();

  Future<NotificationModel> getNotification() async {
    final url = '/notifications';
    print(url);
    final res = await _api.get(url);
    print(res);
    return NotificationModel.fromJson(res.data);
  }
}
