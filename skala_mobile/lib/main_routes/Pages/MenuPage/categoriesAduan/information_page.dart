import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:skala_mobile/main_commons/main_color_data.dart';
import 'package:skala_mobile/main_commons/main_constant_data.dart';
import 'package:skala_mobile/main_commons/main_size_data.dart';
import 'package:skala_mobile/main_widgets/main_custom_appbar_title_widget.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColorData.greybg,
      appBar: const MainCustomAppBarTitle(
        title: "Permintaan Informasi",
        titleStyle: TextStyle(
          color: Color.fromARGB(255, 54, 193, 203),
          fontSize: MainSizeData.SIZE_16,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              height: MainSizeData.SIZE_200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(MainSizeData.SIZE_20),
                image: DecorationImage(
                    image: AssetImage('assets/images/info.png')),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MainSizeData.SIZE_25,
                  vertical: MainSizeData.SIZE_12),
              child: TitleContent(
                title: "Tentang",
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
                description: MainConstantData.kategoriPermintaanInformasi,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MainSizeData.SIZE_25,
                  vertical: MainSizeData.SIZE_12),
              child: TitleContent(
                title:
                    "Perhatikan hal-hal berikut sebelum melakukan permintaan informasi :",
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: MainSizeData.SIZE_16),
              child: Column(
                children: [
                  CheckList(
                    content:
                        "Laporan Anda relevan dengan kinerja pemerintah dalam hal ini Pemerintah Surakarta .",
                  ),
                  SizedBox(
                    height: MainSizeData.SIZE_10,
                  ),
                  CheckList(
                      content:
                          "Menggunakan Bahasa Indonesia yang baik dan benar"),
                  SizedBox(
                    height: MainSizeData.SIZE_10,
                  ),
                  CheckList(
                    content:
                        "Bukan merupakan ujaran kebencian,SARA dan caci maki",
                  ),
                  CheckList(
                      content:
                          "Bukan merupakan laporan yang sudah disampaikan dan masih dalam proses penanganan"),
                  CheckList(
                    content:
                        "Pastikan informasi yang Anda inginkan merupakan informasi yang tidak dikecualikan.w",
                  )
                ],
              ),
            ),
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
              color: Color.fromARGB(255, 54, 193, 203)),
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
          color: MainColorData.grey75),
    );
  }
}

class CheckList extends StatelessWidget {
  const CheckList({
    required this.content,
    this.checkListStyle,
    Key? key,
  }) : super(key: key);
  final String content;
  final TextStyle? checkListStyle;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.check_circle,
          color: Color.fromARGB(255, 54, 193, 203),
          size: MainSizeData.SIZE_18,
        ),
        SizedBox(
          width: MainSizeData.SIZE_10,
        ),
        Expanded(
          child: Text(
            content,
            style: checkListStyle ??
                TextStyle(
                  fontSize: MainSizeData.SIZE_14,
                  fontWeight: FontWeight.normal,
                  color: MainColorData.grey75,
                ),
          ),
        )
      ],
    );
  }
}
