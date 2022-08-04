import 'package:flutter/material.dart';
import 'package:skala_mobile/main_commons/main_color_data.dart';
import 'package:skala_mobile/main_commons/main_size_data.dart';
import 'package:skala_mobile/main_widgets/main_custom_appbar_title_widget.dart';
import 'package:skala_mobile/main_widgets/main_custom_card_praktisi.dart';

class MainKonsultasiListPraktisi extends StatelessWidget {
  const MainKonsultasiListPraktisi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainCustomAppBarTitle(
        title: "Konsultasi",
        titleStyle: TextStyle(
            color: MainColorData.black,
            fontSize: MainSizeData.SIZE_16,
            fontWeight: FontWeight.bold),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [MainCustomCardPraktisi(
            itemName: "Aksal Syah Falah.P.Si",
            itemCategory: "Kesehatan Mental",
            itemImage: 'assets/images/example_praktisi.jpg',
            onPressed: (){},
          ),
          MainCustomCardPraktisi(
            itemName: "Aksal Syah Falah.P.Si",
            itemCategory: "Kesehatan Mental",
            itemImage: 'assets/images/example_praktisi.jpg',
            onPressed: (){},
          ),
          ],
        ),
      ),
    );
  }
}


