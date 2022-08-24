import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:skala_mobile/main_commons/main_color_data.dart';
import 'package:skala_mobile/main_commons/main_constant_data.dart';
import 'package:skala_mobile/main_commons/main_constant_route.dart';
import 'package:skala_mobile/main_commons/main_size_data.dart';
import 'package:skala_mobile/main_routes/Pages/MenuPage/kla_page.dart';
import 'package:skala_mobile/main_widgets/main_category_card_widget.dart';
import 'package:skala_mobile/main_widgets/main_custom_appbar_title_widget.dart';

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
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: MainSizeData.SIZE_25,
                  vertical: MainSizeData.SIZE_12),
              child: TitleContent(
                title: "Tentang",
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: MainSizeData.SIZE_20),
              padding: EdgeInsets.symmetric(
                  vertical: MainSizeData.SIZE_10,
                  horizontal: MainSizeData.SIZE_20),
              decoration: BoxDecoration(
                  color: MainColorData.white,
                  borderRadius: BorderRadius.circular(18)),
              child: DescriptionContent(
                description: MainConstantData.tentangKonsultasi,
              ),
            ),
            SizedBox(
              height: MainSizeData.SIZE_10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: MainSizeData.SIZE_25,
                  vertical: MainSizeData.SIZE_5),
              child: TitleContent(
                title: "Kategori",
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: MainSizeData.SIZE_20),
              padding: EdgeInsets.symmetric(
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
                    onTap: (){
                       Get.toNamed(MainConstantRoute.mainKesehatanMental);
                    },
                  ),
                    MainCategoryCard(
                    label: "Gizi",
                    onTap: (){},
                  ),
                    MainCategoryCard(
                    label: "Kenakalan Remaja",
                    onTap: (){},
                  ),
                ],
              )
            ),
          ],
        ),
      ),
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
      style: TextStyle(
          fontSize: MainSizeData.SIZE_14,
          fontWeight: FontWeight.normal,
          color: MainColorData.green_dop),
    );
  }
}
