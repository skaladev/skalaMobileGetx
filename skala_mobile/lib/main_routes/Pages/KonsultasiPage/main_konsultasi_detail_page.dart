import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:skala_mobile/main_commons/main_color_data.dart';
import 'package:skala_mobile/main_commons/main_size_data.dart';
import 'package:skala_mobile/main_models/main_konsultasi_dummy_model.dart';
import 'package:skala_mobile/main_widgets/main_custom_appbar_title_widget.dart';
import 'package:skala_mobile/main_widgets/main_custom_consultation_card_widget.dart';

class MainKonsultasiDetailPage extends StatelessWidget {
  final KonsultasiDummy? konsultasi;
  const MainKonsultasiDetailPage({Key? key,this.konsultasi}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColorData.white,
      appBar: MainCustomAppBarTitle(
        appBar: AppBar(),
        title: "Konsultasi",
        titleStyle: const TextStyle(
          color: MainColorData.black,
          fontSize: MainSizeData.SIZE_16,
          fontWeight: FontWeight.bold
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MainConsultationCard(
              date: konsultasi?.date??"",
              title: konsultasi?.title ?? "",
              description: konsultasi?.description??"",
              onPressed: (){}
            )
          ],
        ),
      ),
    );
  }
}