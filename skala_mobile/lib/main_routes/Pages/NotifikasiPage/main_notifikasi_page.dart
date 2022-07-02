import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:skala_mobile/main_commons/main_color_data.dart';
import 'package:skala_mobile/main_commons/main_size_data.dart';
import 'package:skala_mobile/main_widgets/main_custom_appbar_title_widget.dart';
import 'package:skala_mobile/main_widgets/main_notification_card.dart';

class MainNotifikasiPage extends StatelessWidget {
  const MainNotifikasiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainCustomAppBarTitle(
        appBar: AppBar(),
        title: "Notifikasi",
        titleStyle: const TextStyle(
            color: MainColorData.black,
            fontSize: MainSizeData.SIZE_16,
            fontWeight: FontWeight.w700),
      ),
      body: SingleChildScrollView(
        child:MainNotificationCard(
          title: "Konsultasi Kekerasan Pada Anak",
          message: "Terkirim",
        )) 
    );
  }
}
