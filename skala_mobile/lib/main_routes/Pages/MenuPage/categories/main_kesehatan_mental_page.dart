import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:skala_mobile/main_commons/main_color_data.dart';
import 'package:skala_mobile/main_commons/main_constant_data.dart';
import 'package:skala_mobile/main_commons/main_size_data.dart';
import 'package:skala_mobile/main_widgets/main_custom_appbar_title_widget.dart';

class MainKesehatanMentalPage extends StatelessWidget {
  const MainKesehatanMentalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColorData.greybg,
      appBar: const MainCustomAppBarTitle(
        title: "Kategori Kesehatan Mental",
        titleStyle: TextStyle(
            color: MainColorData.black,
            fontSize: MainSizeData.SIZE_16,
            fontWeight: FontWeight.bold),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: MainSizeData.SIZE_12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Container(
              alignment: Alignment.center,
              height: MainSizeData.SIZE_300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  MainSizeData.SIZE_20,
                ),
                image: DecorationImage(
                    image: AssetImage(
                      'assets/images/mental_health.png',
                    ),
                    fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: MainSizeData.SIZE_16),
              child: TitleContent(
                title: "Apa itu kesehatan mental?",
              ),
            ),
            SizedBox(height: MainSizeData.SIZE_8),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: MainSizeData.SIZE_16),
              child: DescriptionContent(
                description: MainConstantData.definisiKesehatanMental,
              ),
            ),
            SizedBox(
              height: MainSizeData.SIZE_14,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: MainSizeData.SIZE_16),
              child: TitleContent(
                title:
                    "Apakah kita sudah yakin bahwa mental kita itu sehat? Lalu, bagaimana sih cara mengidentifikasi mental sehat/tidak pada diri kita?",
              ),
            ),
            SizedBox(height: MainSizeData.SIZE_8),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: MainSizeData.SIZE_16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DescriptionContent(
                    description: "Beberapa gejala mental yang tidak sehat : ",
                  ),
                  SizedBox(
                    height: MainSizeData.SIZE_10,
                  ),
                  CheckList(
                    content:
                        "Perubahan sifat(contoh: yang awalnya ceria menjadi lebih sering diam).",
                    checkListStyle: TextStyle(
                        fontSize: MainSizeData.fontSize14,
                        fontWeight: FontWeight.normal,
                        color: MainColorData.green_dop),
                  ),
                  SizedBox(
                    height: MainSizeData.SIZE_10,
                  ),
                  CheckList(
                    content: "Merasa cemas/ketakutan akan suatu hal.",
                    checkListStyle: TextStyle(
                        fontSize: MainSizeData.fontSize14,
                        fontWeight: FontWeight.normal,
                        color: MainColorData.green_dop),
                  ),
                  SizedBox(
                    height: MainSizeData.SIZE_10,
                  ),
                  CheckList(
                    content: "Sering sakit/imunitas tubuh lebih mudah menurun.",
                    checkListStyle: TextStyle(
                        fontSize: MainSizeData.fontSize14,
                        fontWeight: FontWeight.normal,
                        color: MainColorData.green_dop),
                  ),
                  SizedBox(
                    height: MainSizeData.SIZE_10,
                  ),
                  CheckList(
                    content:
                        "Perubahan pola tidur. Bisa insomnia(susah tidur) atau bahkan terlalu banyak tidur.",
                    checkListStyle: TextStyle(
                        fontSize: MainSizeData.fontSize14,
                        fontWeight: FontWeight.normal,
                        color: MainColorData.green_dop),
                  ),
                  SizedBox(
                    height: MainSizeData.SIZE_10,
                  ),
                  CheckList(
                    content:
                        "Menjadi pribadi yang moody-an(mood tidak teratur)",
                    checkListStyle: TextStyle(
                        fontSize: MainSizeData.fontSize14,
                        fontWeight: FontWeight.normal,
                        color: MainColorData.green_dop),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MainSizeData.SIZE_10,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: MainSizeData.SIZE_16),
              child: TitleContent(
                title: "Penyebab Gangguan Kesehatan Mental",
              ),
            ),
            SizedBox(
              height: MainSizeData.SIZE_10,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: MainSizeData.SIZE_16),
              child: Column(
                children: [
                  DescriptionContent(
                    description:
                        "1. Faktor Biologi : Genetik, kimia pada otak, gangguan pada otak.",
                  ),
                  SizedBox(
                    height: MainSizeData.SIZE_6,
                  ),
                  DescriptionContent(
                    description:
                        "2. Faktor kehidupan: trauma, pelecehan, racun, alkohol, obat-obatan.",
                  ),
                  SizedBox(
                    height: MainSizeData.SIZE_6,
                  ),
                  DescriptionContent(
                    description:
                        "3. Faktor keluarga: riwayat keluarga, masalah keluarga.",
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MainSizeData.SIZE_10,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: MainSizeData.SIZE_16),
              child: TitleContent(
                title: "Gejala Awal Gangguan Kesehatan Mental ?",
              ),
            ),
            SizedBox(height: MainSizeData.SIZE_10),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: MainSizeData.SIZE_16),
              child: Column(
                children: [
                  CheckList(
                    content: "Makan atau tidur terlalu sedikit atau banyak",
                  ),
                  SizedBox(
                    height: MainSizeData.SIZE_10,
                  ),
                  CheckList(
                    content: "Menarik diri dari orang lain dan aktivitas umum",
                  ),
                  SizedBox(
                    height: MainSizeData.SIZE_10,
                  ),
                  CheckList(
                    content:
                        "Tidak berenergi atau hanya memiliki sedikit energi",
                  ),
                  SizedBox(
                    height: MainSizeData.SIZE_10,
                  ),
                  CheckList(
                    content: "Merasa mati rasa atau tidak ada yang berarti",
                  ),
                  SizedBox(
                    height: MainSizeData.SIZE_10,
                  ),
                  CheckList(
                    content: "Mengalami nyeri yang tidak dapat dijelaskan",
                  ),
                  SizedBox(
                    height: MainSizeData.SIZE_10,
                  ),
                  CheckList(
                    content: "Merasa tak berdaya atau putus asa",
                  ),
                  SizedBox(
                    height: MainSizeData.SIZE_10,
                  ),
                  CheckList(
                    content:
                        "Merokok, minum alkohol lebih dari biasanya atau bahkan menggunakan narkoba",
                  ),
                  SizedBox(
                    height: MainSizeData.SIZE_10,
                  ),
                  CheckList(
                    content:
                        "Merasa bingung, pelupa, marah, cemas, dan takut yang tidak biasa",
                  ),
                  SizedBox(
                    height: MainSizeData.SIZE_10,
                  ),
                  CheckList(
                    content:
                        "Mengalami perubahan mood (mood swing) yang parah sehingga menyebabkan masalah pada hubungan dengan orang lain",
                  ),
                  SizedBox(
                    height: MainSizeData.SIZE_10,
                  ),
                  CheckList(
                    content:
                        "Memiliki pemikiran dan kenangan yang persisten dan tidak bisa dikeluarkan dari kepala",
                  ),
                  SizedBox(
                    height: MainSizeData.SIZE_10,
                  ),
                  CheckList(
                    content:
                        "Mendengar suara atau mempercayai sesuatu yang tidak benar",
                  ),
                  SizedBox(
                    height: MainSizeData.SIZE_10,
                  ),
                  CheckList(
                    content:
                        "Berpikir untuk menyakiti diri sendiri atau orang lain",
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MainSizeData.SIZE_10,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: MainSizeData.SIZE_16),
              child: TitleContent(
                title: "Diagnosis",
              ),
            ),
            SizedBox(height: MainSizeData.SIZE_8),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: MainSizeData.SIZE_16),
              child: DescriptionContent(
                description: MainConstantData.diagnosis1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: MainSizeData.SIZE_16,
                  vertical: MainSizeData.SIZE_8),
              child: DescriptionContent(
                description: MainConstantData.diagnosis2,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: MainSizeData.SIZE_16),
              child: DescriptionContent(
                description: MainConstantData.diagnosis3,
              ),
            ),
            SizedBox(
              height: MainSizeData.SIZE_10,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: MainSizeData.SIZE_16),
              child: TitleContent(
                title: "Pengobatan",
              ),
            ),
            SizedBox(height: MainSizeData.SIZE_8),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: MainSizeData.SIZE_16),
              child: DescriptionContent(
                description: MainConstantData.pengobatan1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: MainSizeData.SIZE_16,
                  vertical: MainSizeData.SIZE_8),
              child: DescriptionContent(
                description: MainConstantData.pengobatan2,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: MainSizeData.SIZE_16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DescriptionContent(
                    description: MainConstantData.pengobatan3,
                  ),
                  SizedBox(
                    height: MainSizeData.SIZE_10,
                  ),
                  CheckList(
                    content:
                        "Stimulasi otak termasuk terapi electrokonvulsif, stimulasi magnetik transkranial, pengobatan eksperimental yang disebut stimulasi otak dalam, dan stimulasi saraf vagus.",
                    checkListStyle: TextStyle(
                        fontSize: MainSizeData.fontSize14,
                        fontWeight: FontWeight.normal,
                        color: MainColorData.green_dop),
                  ),
                  SizedBox(
                    height: MainSizeData.SIZE_10,
                  ),
                  CheckList(
                    content: "Perawatan rumah sakit dan perumahan.",
                    checkListStyle: TextStyle(
                        fontSize: MainSizeData.fontSize14,
                        fontWeight: FontWeight.normal,
                        color: MainColorData.green_dop),
                  ),
                  SizedBox(
                    height: MainSizeData.SIZE_10,
                  ),
                  CheckList(
                    content: "Pengobatan penyalahgunaan zat.",
                    checkListStyle: TextStyle(
                        fontSize: MainSizeData.fontSize14,
                        fontWeight: FontWeight.normal,
                        color: MainColorData.green_dop),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MainSizeData.SIZE_10,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: MainSizeData.SIZE_16),
              child: TitleContent(
                title: "Pencegahan",
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: MainSizeData.SIZE_16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DescriptionContent(
                    description: "Mencegah terjadi gangguan mental dapat dilakukan dengan menjaga kesehatan mental yang positif, seperti:",
                  ),
                  SizedBox(
                    height: MainSizeData.SIZE_10,
                  ),
                  CheckList(
                    content:
                        "Tetap berhubungan dengan orang lain.",
                    checkListStyle: TextStyle(
                        fontSize: MainSizeData.fontSize14,
                        fontWeight: FontWeight.normal,
                        color: MainColorData.green_dop),
                  ),
                  SizedBox(
                    height: MainSizeData.SIZE_10,
                  ),
                  CheckList(
                    content: "Terus berpikir positif.",
                    checkListStyle: TextStyle(
                        fontSize: MainSizeData.fontSize14,
                        fontWeight: FontWeight.normal,
                        color: MainColorData.green_dop),
                  ),
                  SizedBox(
                    height: MainSizeData.SIZE_10,
                  ),
                  CheckList(
                    content: "Tetap aktif secara fisik.",
                    checkListStyle: TextStyle(
                        fontSize: MainSizeData.fontSize14,
                        fontWeight: FontWeight.normal,
                        color: MainColorData.green_dop),
                  ),
                   SizedBox(
                    height: MainSizeData.SIZE_10,
                  ),
                  CheckList(
                    content: "Membantu orang lain.",
                    checkListStyle: TextStyle(
                        fontSize: MainSizeData.fontSize14,
                        fontWeight: FontWeight.normal,
                        color: MainColorData.green_dop),
                  ),
                   SizedBox(
                    height: MainSizeData.SIZE_10,
                  ),
                  CheckList(
                    content: "Cukup tidur atau istirahat.",
                    checkListStyle: TextStyle(
                        fontSize: MainSizeData.fontSize14,
                        fontWeight: FontWeight.normal,
                        color: MainColorData.green_dop),
                  ),
                  SizedBox(
                    height: MainSizeData.SIZE_10,
                  ),
                  CheckList(
                    content: "Memiliki kemampuan untuk mengatasi masalah.",
                    checkListStyle: TextStyle(
                        fontSize: MainSizeData.fontSize14,
                        fontWeight: FontWeight.normal,
                        color: MainColorData.green_dop),
                  ),
                  SizedBox(
                    height: MainSizeData.SIZE_10,
                  ),
                  CheckList(
                    content: "Mencari bantuan profesional jika diperlukan.",
                    checkListStyle: TextStyle(
                        fontSize: MainSizeData.fontSize14,
                        fontWeight: FontWeight.normal,
                        color: MainColorData.green_dop),
                  ),
                ],
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
    this.descriptionStyle,
  }) : super(key: key);
  final String description;
  final TextStyle? descriptionStyle;
  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: descriptionStyle ??
          TextStyle(
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
