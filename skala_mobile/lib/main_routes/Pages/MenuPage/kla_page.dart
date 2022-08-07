import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:skala_mobile/main_commons/main_color_data.dart';
import 'package:skala_mobile/main_commons/main_constant_data.dart';
import 'package:skala_mobile/main_commons/main_size_data.dart';
import 'package:skala_mobile/main_widgets/main_custom_appbar_title_widget.dart';

class KlaPage extends StatelessWidget {
  const KlaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainCustomAppBarTitle(
        title: "Tentang Kota Layak Anak",
        titleStyle: TextStyle(
            color: MainColorData.black,
            fontSize: MainSizeData.SIZE_16,
            fontWeight: FontWeight.bold),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              height: MainSizeData.SIZE_180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  MainSizeData.SIZE_20,
                ),
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/logo_kla.png',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MainSizeData.SIZE_16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: MainSizeData.SIZE_16),
              child: TitleContent(
                title: "Apa itu KLA?",
              ),
            ),
            SizedBox(height: MainSizeData.SIZE_8),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: MainSizeData.SIZE_16),
              child: DescriptionContent(
                description: MainConstantData.definitionKla,
              ),
            ),
            SizedBox(
              height: MainSizeData.SIZE_14,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: MainSizeData.SIZE_16),
              child: TitleContent(
                title: "Apa tujuan KLA?",
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: MainSizeData.SIZE_300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  MainSizeData.SIZE_20,
                ),
                image: DecorationImage(
                    image: AssetImage(
                      'assets/images/tujuan.png',
                    ),
                    fit: BoxFit.cover),
              ),
            ),
            SizedBox(height: MainSizeData.SIZE_16),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: MainSizeData.SIZE_16),
              child: Column(
                children: [
                  CheckList(
                    content: MainConstantData.tujuan1,
                  ),
                  SizedBox(
                    height: MainSizeData.SIZE_10,
                  ),
                  CheckList(
                    content: MainConstantData.tujuan2,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MainSizeData.SIZE_14,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: MainSizeData.SIZE_16),
              child: TitleContent(
                title: "Apa Landasan Hukum KLA ?",
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: MainSizeData.SIZE_16,
                  vertical: MainSizeData.SIZE_4),
              child: TitleContent(
                title: "Internasional",
                titleStyle: TextStyle(
                    fontSize: MainSizeData.SIZE_16,
                    fontWeight: FontWeight.w400,
                    color: MainColorData.green_dop3),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: MainSizeData.SIZE_16),
              child: Column(
                children: [
                  CheckList(
                    content: "Deklarasi Hak Asasi Manusia",
                    checkListStyle: TextStyle(
                        fontSize: MainSizeData.fontSize14,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.italic,
                        color: MainColorData.green_dop),
                  ),
                  SizedBox(
                    height: MainSizeData.SIZE_10,
                  ),
                  CheckList(
                    content: "Konvesi Hak-hak Anak",
                    checkListStyle: TextStyle(
                        fontSize: MainSizeData.fontSize14,
                        fontWeight: FontWeight.normal,
                        color: MainColorData.green_dop),
                  ),
                  SizedBox(
                    height: MainSizeData.SIZE_10,
                  ),
                  CheckList(
                    content: "World Fit For Children",
                    checkListStyle: TextStyle(
                        fontSize: MainSizeData.fontSize14,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.italic,
                        color: MainColorData.green_dop),
                  ),
                  SizedBox(
                    height: MainSizeData.SIZE_10,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: MainSizeData.SIZE_16,
                  vertical: MainSizeData.SIZE_4),
              child: TitleContent(
                title: "Nasional",
                titleStyle: TextStyle(
                    fontSize: MainSizeData.SIZE_16,
                    fontWeight: FontWeight.w400,
                    color: MainColorData.green_dop3),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: MainSizeData.SIZE_16),
              child: Column(
                children: [
                  CheckList(
                    content:
                        "Undang-Undang Dasar 1945 Pasal 28b ayat 2 dan 28c",
                  ),
                  SizedBox(
                    height: MainSizeData.SIZE_10,
                  ),
                  CheckList(
                    content: "UU 2/2015 tentang RPJMN 2015-2019",
                  ),
                  SizedBox(
                    height: MainSizeData.SIZE_10,
                  ),
                  CheckList(
                    content: "UU 17/2007 tentang RPJPN 2005-2025",
                  ),
                  SizedBox(
                    height: MainSizeData.SIZE_10,
                  ),
                  CheckList(
                    content: "UU 23/2014 tentang Pemerintahan Daerah",
                  ),
                  SizedBox(
                    height: MainSizeData.SIZE_10,
                  ),
                  CheckList(
                    content:
                        "UU 35/2014 perubahan atas 23/2002 tentang Perlindungan Anak",
                  ),
                  SizedBox(
                    height: MainSizeData.SIZE_10,
                  ),
                  CheckList(
                    content:
                        "UU 12/2011 tentang Sistem Peradilan Pidana Anak",
                  ),
                  SizedBox(
                    height: MainSizeData.SIZE_10,
                  ),
                  CheckList(
                    content:
                        "Inpres 01/2010 tentang Program Prioritas Pembangunan Nasional",
                  ),
                  SizedBox(
                    height: MainSizeData.SIZE_10,
                  ),
                  CheckList(
                    content:
                        "Inpres 05/2014 tentang Gerakan Nasional “Anti Kejahatan Seksual terhadap Anak (GN-AKSA)",
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MainSizeData.SIZE_14,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: MainSizeData.SIZE_16),
              child: TitleContent(
                title: "Keterkaitan HAM, KHA & KLA",
                titleStyle: TextStyle(
                    fontSize: MainSizeData.SIZE_16,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: MainColorData.green_dop),
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: MainSizeData.SIZE_250,
              width: MainSizeData.SIZE_400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  MainSizeData.SIZE_20,
                ),
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/kla_2.png',
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: MainSizeData.SIZE_450,
              width: MainSizeData.SIZE_400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  MainSizeData.SIZE_20,
                ),
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/kla_3.png',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MainSizeData.SIZE_14,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: MainSizeData.SIZE_16),
              child: TitleContent(
                title: "Langkah-Langkah Pengembangan KLA",
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: MainSizeData.SIZE_16,
                  vertical: MainSizeData.SIZE_4),
              child: TitleContent(
                title: "Tahap Persiapan",
                titleStyle: TextStyle(
                    fontSize: MainSizeData.SIZE_16,
                    fontWeight: FontWeight.w400,
                    color: MainColorData.green_dop3),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: MainSizeData.SIZE_16),
              child: Column(
                children: [
                  CheckList(
                    content: "Komitmen Politis KLA",
                  ),
                  SizedBox(
                    height: MainSizeData.SIZE_10,
                  ),
                  CheckList(
                    content: "Pembentukan Gugus Tugas KLA",
                  ),
                  SizedBox(
                    height: MainSizeData.SIZE_10,
                  ),
                  CheckList(
                    content: "Pengumpulan Data Basis KLA",
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: MainSizeData.SIZE_16,
                  vertical: MainSizeData.SIZE_4),
              child: TitleContent(
                title: "Tahap Perencanaan",
                titleStyle: TextStyle(
                    fontSize: MainSizeData.SIZE_16,
                    fontWeight: FontWeight.w400,
                    color: MainColorData.green_dop3),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: MainSizeData.SIZE_16),
              child: CheckList(
                content: "Penyusunan Rencana Aksi Daerah(RAD)KLA",
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: MainSizeData.SIZE_16,
                  vertical: MainSizeData.SIZE_4),
              child: TitleContent(
                title: "Tahap Pelaksanaan",
                titleStyle: TextStyle(
                    fontSize: MainSizeData.SIZE_16,
                    fontWeight: FontWeight.w400,
                    color: MainColorData.green_dop3),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: MainSizeData.SIZE_16),
              child: CheckList(
                content:
                    "Mobilisasi Sumber Daya: Pelaksanaan Rencana Aksi Daerah(RAD) KLA",
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: MainSizeData.SIZE_16,
                  vertical: MainSizeData.SIZE_4),
              child: TitleContent(
                title: "Tahap Pemantauan dan Evaluasi",
                titleStyle: TextStyle(
                    fontSize: MainSizeData.SIZE_16,
                    fontWeight: FontWeight.w400,
                    color: MainColorData.green_dop3),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: MainSizeData.SIZE_16),
              child: Column(
                children: [
                  CheckList(
                    content: "Pemantauan KLA",
                  ),
                  SizedBox(
                    height: MainSizeData.SIZE_10,
                  ),
                  CheckList(
                    content: "Evaluasi KLA",
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: MainSizeData.SIZE_16,
                  vertical: MainSizeData.SIZE_4),
              child: TitleContent(
                title: "Tahap Pelaporan",
                titleStyle: TextStyle(
                    fontSize: MainSizeData.SIZE_16,
                    fontWeight: FontWeight.w400,
                    color: MainColorData.green_dop3),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: MainSizeData.SIZE_16),
              child: CheckList(
                content: "Pelaporan Pelaksanaan KLA",
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: MainSizeData.SIZE_500,
              width: MainSizeData.SIZE_400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  MainSizeData.SIZE_20,
                ),
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/kla_4.png',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
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
          color: MainColorData.green_dop,
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
                  color: MainColorData.green_dop,
                ),
          ),
        )
      ],
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
      MainConstantData.definitionKla,
      style: TextStyle(
          fontSize: MainSizeData.SIZE_14,
          fontWeight: FontWeight.normal,
          color: MainColorData.green_dop),
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
          TextStyle(
              fontSize: MainSizeData.SIZE_16,
              fontWeight: FontWeight.bold,
              color: MainColorData.green_dop),
    );
  }
}
