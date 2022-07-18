import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/route_manager.dart';
import 'package:skala_mobile/main_commons/main_color_data.dart';
import 'package:skala_mobile/main_commons/main_constant_route.dart';
import 'package:skala_mobile/main_commons/main_size_data.dart';
import 'package:skala_mobile/main_models/main_konsultasi_dummy_model.dart';
import 'package:skala_mobile/main_widgets/main_custom_appbar_title_widget.dart';

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
      onPressed: () {});
}

class MainConsultationCard extends StatelessWidget {
  const MainConsultationCard({
    Key? key,
    this.title,
    this.date,
    this.time,
    required this.onPressed,
  }) : super(key: key);
  final String? title;
  final String? date;
  final String? time;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Card(
        margin: const EdgeInsets.symmetric(
            horizontal: MainSizeData.SIZE_20, vertical: MainSizeData.SIZE_5),
        elevation: 0,
        color: MainColorData.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(MainSizeData.SIZE_8),
          side: const BorderSide(
            color: MainColorData.grey,
            width: MainSizeData.SIZE_1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: MainSizeData.SIZE_20, vertical: MainSizeData.SIZE_20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    date ?? '',
                    style: const TextStyle(
                        color: MainColorData.grey,
                        fontSize: MainSizeData.SIZE_10,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    width: MainSizeData.SIZE_8,
                  ),
                  Text(
                    time ?? '',
                    style: const TextStyle(
                        color: MainColorData.grey,
                        fontSize: MainSizeData.SIZE_10,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    width: MainSizeData.SIZE_20,
                  ),
                  Container(
                    child: StatusSection(status: 'diterima') ,
                  )
                ],
              ),
              const SizedBox(
                height: MainSizeData.SIZE_8,
              ),
              Text(
                title!.toUpperCase(),
                style: const TextStyle(
                  color: MainColorData.black,
                  fontSize: MainSizeData.SIZE_14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StatusSection extends StatelessWidget {
  const StatusSection({Key? key, required this.status}) : super(key: key);
  final String status;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: MainSizeData.SIZE_10, vertical: MainSizeData.SIZE_4),
      decoration: BoxDecoration(
          color: statusColor(),
          borderRadius: BorderRadius.circular(MainSizeData.SIZE_20)),
      child: Text(
        status,
        style: const TextStyle(
            color: MainColorData.white,
            fontSize: MainSizeData.SIZE_8,
            fontWeight: FontWeight.w900),
      ),
    );
  }

  Color? statusColor() {
    switch (status.toLowerCase()) {
      case 'diterima':
        return MainColorData.green;
      case 'ditolak':
        return MainColorData.redEF;
    }
  }
}
