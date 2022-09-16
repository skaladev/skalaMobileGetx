import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skala_mobile/main_commons/main_color_data.dart';
import 'package:skala_mobile/main_commons/main_constant_data.dart';
import 'package:skala_mobile/main_commons/main_constant_route.dart';
import 'package:skala_mobile/main_commons/main_size_data.dart';
import 'package:skala_mobile/main_models/main_step_consultation.dart';
import 'package:skala_mobile/main_widgets/main_category_card_widget.dart';
import 'package:skala_mobile/main_widgets/main_custom_appbar_title_widget.dart';
import 'package:timeline_tile/timeline_tile.dart';

class MainMenuKonsultasiPage extends StatelessWidget {
  const MainMenuKonsultasiPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColorData.greybg,
      appBar: const MainCustomAppBarTitle(
        title: "Konsultasi",
        titleStyle: TextStyle(
            color: MainColorData.black,
            fontSize: MainSizeData.SIZE_16,
            fontWeight: FontWeight.bold),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MainSizeData.SIZE_25,
                  vertical: MainSizeData.SIZE_12),
              child: TitleContent(
                title: "Informasi Umum",
              ),
            ),
            Container(
              width: double.infinity,
              margin:
                  const EdgeInsets.symmetric(horizontal: MainSizeData.SIZE_20),
              padding: const EdgeInsets.symmetric(
                  vertical: MainSizeData.SIZE_10,
                  horizontal: MainSizeData.SIZE_20),
              decoration: BoxDecoration(
                  color: MainColorData.white,
                  borderRadius: BorderRadius.circular(18)),
              child: const DescriptionContent(
                description: MainConstantData.tentangKonsultasi,
              ),
            ),
            const SizedBox(
              height: MainSizeData.SIZE_10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MainSizeData.SIZE_25,
                  vertical: MainSizeData.SIZE_5),
              child: TitleContent(
                title: "Kategori",
              ),
            ),
            Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(
                    horizontal: MainSizeData.SIZE_18),
                padding: const EdgeInsets.symmetric(
                    vertical: MainSizeData.SIZE_10,
                    horizontal: MainSizeData.SIZE_20),
                decoration: BoxDecoration(
                    color: MainColorData.white,
                    borderRadius: BorderRadius.circular(18)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MainCategoryCard(
                      label: "Kesehatan Mental",
                      onTap: () {
                        Get.toNamed(MainConstantRoute.mainKesehatanMental);
                      },
                    ),
                    MainCategoryCard(
                      label: "Gizi",
                      onTap: () {},
                    ),
                    MainCategoryCard(
                      label: "Kenakalan Remaja",
                      onTap: () {},
                    ),
                  ],
                )),
            const SizedBox(
              height: MainSizeData.SIZE_10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MainSizeData.SIZE_25,
                  vertical: MainSizeData.SIZE_5),
              child: TitleContent(
                title: "Panduan Konsultasi",
              ),
            ),
            FutureBuilder<String>(
              future: DefaultAssetBundle.of(context)
                  .loadString('assets/stepKonsultasi.json'),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  final List<StepConsultation> step = parseSteps(snapshot.data);
                  return Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(
                        horizontal: MainSizeData.SIZE_20),
                    padding: const EdgeInsets.symmetric(
                        vertical: MainSizeData.SIZE_10,
                        horizontal: MainSizeData.SIZE_20),
                    decoration: BoxDecoration(
                        color: MainColorData.white,
                        borderRadius: BorderRadius.circular(18)),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: step.length,
                      itemBuilder: ((context, index) {
                        return TimelineTile(
                          alignment: TimelineAlign.manual,
                          lineXY: 0.02,
                          isFirst: index == 0,
                          endChild: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      step[index].title,
                                      style: const TextStyle(
                                          fontFamily: "Roboto",
                                          fontSize: MainSizeData.fontSize16,
                                          fontWeight: FontWeight.bold,
                                          color: MainColorData.green_dop),
                                    ),
                                    const SizedBox(height: MainSizeData.SIZE_6),
                                    Text(
                                      step[index].description,
                                      style: const TextStyle(
                                          fontSize: MainSizeData.fontSize14,
                                          fontWeight: FontWeight.w400,
                                          color: MainColorData.green_dop),
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(
                                thickness: 2,
                              ),
                            ],
                          ),
                          indicatorStyle: IndicatorStyle(
                            width: 30,
                            height: 30,
                            indicator: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.fromBorderSide(
                                  BorderSide(
                                    color: MainColorData.green_dop
                                        .withOpacity(0.8),
                                    width: 2,
                                  ),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "${index + 1}",
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ),
                            ),
                            drawGap: true,
                          ),
                          beforeLineStyle: LineStyle(
                            color: MainColorData.green_dop.withOpacity(0.2),
                          ),
                        );
                      }),
                    ),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
            const SizedBox(height: MainSizeData.SIZE_10),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed(MainConstantRoute.mainListPraktisi);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: MainColorData.green_dop3,
                    padding: const EdgeInsets.symmetric(
                        horizontal: MainSizeData.SIZE_18,
                        vertical: MainSizeData.SIZE_8),
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(MainSizeData.SIZE_12))),
                child: const Text(
                  'Mulai Konsultasi',
                  style: TextStyle(
                      fontSize: MainSizeData.SIZE_12,
                      fontWeight: FontWeight.w600,
                      color: MainColorData.white),
                ),
              ),
            ),
            const SizedBox(height: MainSizeData.SIZE_30),
          ],
        ),
      ),
    );
  }
}

class TitleContent extends StatelessWidget {
  const TitleContent({
    required this.title,
    this.titleStyle,
    Key? key,
  }) : super(key: key);
  final String title;
  final TextStyle? titleStyle;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: titleStyle ??
          const TextStyle(
              fontFamily: 'Roboto',
              fontSize: MainSizeData.SIZE_20,
              fontWeight: FontWeight.bold,
              color: MainColorData.green_dop),
    );
  }
}

class DescriptionContent extends StatelessWidget {
  const DescriptionContent({
    required this.description,
    Key? key,
  }) : super(key: key);
  final String description;
  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: const TextStyle(
          fontSize: MainSizeData.SIZE_14,
          fontWeight: FontWeight.normal,
          color: MainColorData.green_dop),
    );
  }
}
