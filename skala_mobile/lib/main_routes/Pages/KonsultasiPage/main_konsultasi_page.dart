import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/route_manager.dart';
import 'package:skala_mobile/main_commons/main_color_data.dart';
import 'package:skala_mobile/main_commons/main_constant_route.dart';
import 'package:skala_mobile/main_commons/main_size_data.dart';
import 'package:skala_mobile/main_models/main_konsultasi_dummy_model.dart';
import 'package:skala_mobile/main_routes/Pages/KonsultasiPage/main_konsultasi_detail_page.dart';
import 'package:skala_mobile/main_widgets/main_custom_appbar_title_widget.dart';
import 'package:skala_mobile/main_widgets/main_custom_consultation_card_widget.dart';

class MainKonsultasiPage extends StatelessWidget {
  const MainKonsultasiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColorData.white,
      appBar: MainCustomAppBarTitle(
        title: "Konsultasi",
        isIconEnabled: false,
        titleStyle: const TextStyle(
            color: MainColorData.black,
            fontSize: MainSizeData.fontSize16,
            fontWeight: FontWeight.bold),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          FutureBuilder<String>(
            future: DefaultAssetBundle.of(context)
                .loadString('assets/konsultasi.json'),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                final List<KonsultasiDummy> konsultasi =
                    parseKonsultasi(snapshot.data);
                return SizedBox(
                  height: MainSizeData.SIZE_700,
                  child: ListView.builder(
                    itemCount: konsultasi.length,
                    itemBuilder: (context, index) {
                      return _buildKonsultasiItem(context, konsultasi[index]);
                    },
                  ),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          )
        ],
      )),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(
            right: MainSizeData.SIZE_10, bottom: MainSizeData.SIZE_12),
        child: FloatingActionButton(
          onPressed: () {
            Get.toNamed(MainConstantRoute.mainAddKonsultasi);
          },
          child: Icon(Icons.add),
          backgroundColor: MainColorData.green_dop,
        ),
      ),
    );
  }
}

Widget _buildKonsultasiItem(
    BuildContext context, KonsultasiDummy konsultasiDummy) {
  return MainConsultationCard(
      title: konsultasiDummy.title,
      date: konsultasiDummy.date,
      onPressed: () {
        Get.to(MainKonsultasiDetailPage(konsultasi: konsultasiDummy,));
      });
}

