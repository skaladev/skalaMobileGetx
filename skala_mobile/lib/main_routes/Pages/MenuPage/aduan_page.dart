import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:skala_mobile/main_commons/main_color_data.dart';
import 'package:skala_mobile/main_commons/main_constant_data.dart';
import 'package:skala_mobile/main_commons/main_constant_route.dart';
import 'package:skala_mobile/main_commons/main_size_data.dart';
import 'package:skala_mobile/main_widgets/main_custom_appbar_title_widget.dart';

class MainAduanPage extends StatelessWidget {
  const MainAduanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColorData.greybg,
      appBar: const MainCustomAppBarTitle(
        title: "Aduan",
        titleStyle: TextStyle(
          color: Color.fromARGB(255, 154, 99, 99),
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
                  borderRadius: BorderRadius.circular(
                    MainSizeData.SIZE_20,
                  ),
                  image: DecorationImage(
                      image: AssetImage('assets/images/aduan.png'))),
            ),
            Padding(
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
                description: MainConstantData.informasiAduan,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MainSizeData.SIZE_25,
                  vertical: MainSizeData.SIZE_12),
              child: TitleContent(
                title: "Layanan yang tersedia ?",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                itemMenuHome(
                  title: "Informasi",
                  icon: "assets/images/info.png",
                  onPressed: () {
                    Get.toNamed(MainConstantRoute.mainKla);
                  },
                ),
                itemMenuHome(
                  title: "Pengaduan",
                  icon: "assets/images/talk.png",
                  onPressed: () {
                    Get.toNamed(MainConstantRoute.mainMenuKonsultasi);
                  },
                ),
                itemMenuHome(
                  title: "Aspirasi",
                  icon: "assets/images/lamp.png",
                  onPressed: () {
                    Get.toNamed(MainConstantRoute.mainAduan);
                  },
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: MainSizeData.SIZE_16),
              child: Column(
                children: [
                  CheckList(
                    content:
                        "Anda dapat mengirimkan aduan melalui aplikasi SKALA, dan berbagai kanal yang dimiliki oleh Pemeritah Kota Surakarta.",
                  ),
                  SizedBox(
                    height: MainSizeData.SIZE_10,
                  ),
                  CheckList(
                    content:
                        "Humas Skala selaku bagian yang menangani aduan diberikan paling lambat 5 hari untuk melakukan koordinasi internal dan perumusan tindak lanjut dari pengaduan yang diberikan.",
                  ),
                  SizedBox(
                    height: MainSizeData.SIZE_10,
                  ),
                  CheckList(
                    content:
                        "Apabila sudah ada rumusan tidak lanjut, maka Humas akan memberikan balasan informasi kepada anda.",
                  )
                ],
              ),
            ),
            SizedBox(
              height: MainSizeData.SIZE_20,
            )
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
              color: Color.fromARGB(255, 154, 99, 99)),
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
          color: Color.fromARGB(255, 248, 132, 130),
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

class itemMenuHome extends StatelessWidget {
  const itemMenuHome({
    required this.title,
    required this.icon,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final String title;
  final String icon;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: MainSizeData.SIZE_18),
        child: Column(
          children: [
            Container(
                width: MainSizeData.SIZE_50,
                height: MainSizeData.SIZE_50,
                child: Image.asset(
                  icon,
                  fit: BoxFit.cover,
                )),
            SizedBox(height: MainSizeData.SIZE_5),
            Text(
              title,
              style: TextStyle(
                  fontSize: MainSizeData.SIZE_12,
                  fontWeight: FontWeight.bold,
                  color: MainColorData.green_dop),
            )
          ],
        ),
      ),
    );
  }
}
