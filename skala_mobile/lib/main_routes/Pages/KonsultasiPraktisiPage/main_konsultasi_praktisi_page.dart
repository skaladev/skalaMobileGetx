import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:skala_mobile/main_commons/main_color_data.dart';
import 'package:skala_mobile/main_commons/main_constant_route.dart';
import 'package:skala_mobile/main_commons/main_size_data.dart';
import 'package:skala_mobile/main_widgets/main_custom_appbar_title_widget.dart';
import 'package:skala_mobile/main_widgets/main_custom_card_widget.dart';
import 'package:skala_mobile/main_widgets/main_custom_consultation_card_widget.dart';

class MainKonsultasiPraktisiPage extends StatelessWidget {
  const MainKonsultasiPraktisiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColorData.white,
      appBar: const MainCustomAppBarTitle(
        title: "Konsultasi",
        isIconEnabled: false,
        titleStyle: TextStyle(
          color: MainColorData.black,
          fontSize: MainSizeData.fontSize16,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: MainSizeData.SIZE_18, vertical: MainSizeData.SIZE_8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Kategori',
                style: const TextStyle(
                    color: MainColorData.grey,
                    fontSize: MainSizeData.SIZE_14,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: MainSizeData.SIZE_8,
              ),
              Container(
                height:MainSizeData.SIZE_90,
                child: ListView.builder(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: ((context, index) {
                    return  MainCustomCard(
                        itemTitle: "Kesehatan Mental",
                        onTap: () {
                          Get.toNamed(MainConstantRoute.mainListPraktisi);
                        },
                      );
                  }),
                ),
              ),
              // SizedBox(
              //   height: MainSizeData.SIZE_120,
              //   child: Row(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Expanded(
              //         child: MainCustomCard(
              //           itemCount: "9",
              //           itemTitle: "Kesehatan Mental",
              //           onTap: () {
              //             Get.toNamed(MainConstantRoute.mainListPraktisi);
              //           },
              //         ),
              //       ),
              //       Expanded(
              //         child: MainCustomCard(
              //           itemCount: "9",
              //           itemTitle: "Gizi Anak",
              //           onTap: () {},
              //         ),
              //       ),
              //       Expanded(
              //         child: MainCustomCard(
              //           itemCount: "9",
              //           itemTitle: "Kenakalan Remaja",
              //           onTap: () {},
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
               SizedBox(
                height: MainSizeData.SIZE_14,
              ),
               Text(
                'Daftar Konsultasi',
                style: const TextStyle(
                    color: MainColorData.grey,
                    fontSize: MainSizeData.SIZE_14,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: MainSizeData.SIZE_8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
