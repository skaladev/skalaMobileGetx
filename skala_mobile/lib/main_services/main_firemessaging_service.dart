import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

class FiremessagingService {
  static void sendNotification(String title, String body, String token) async {
    final data = {
      'click_action': 'FLUTTER_NOTIFICATION_CLICK',
      'id': '1',
      'status': 'done',
      'message': title,
    };

    try {
      http.Response response =
          await http.post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
              headers: <String, String>{
                'Content-Type': 'application/json',
                'Authorization':
                    'key=AAAAondVnBE:APA91bE5yIisJDalyodp-csZg-fWHcXvVlXJS6dxRXyMFBj9bXFUoqr-w1FxfWp8MVwcGxgydjdgWXg5lnSXabl2lGNDLi3BF5gSWBiv8-msbrctH_7KBbfy3mZRDvQvNSU5ymWt0bah'
              },
              body: jsonEncode(<String, dynamic>{
                'notification': <String, dynamic>{
                  'title': title,
                  'body': body,
                },
                'priority': 'high',
                'data': data,
                'to': token
              }));

      if (response.statusCode == 200) {
        print("Notifikasi Berhasil dikirim");
      } else {
        print("Error");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
