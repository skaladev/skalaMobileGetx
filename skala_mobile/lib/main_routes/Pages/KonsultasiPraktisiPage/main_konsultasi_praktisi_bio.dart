import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:skala_mobile/main_commons/main_color_data.dart';
import 'package:skala_mobile/main_commons/main_constant_route.dart';
import 'package:skala_mobile/main_commons/main_size_data.dart';
import 'package:skala_mobile/main_models/main_consultant_list_model.dart';
import 'package:skala_mobile/main_widgets/main_custom_appbar_title_widget.dart';
import 'package:skala_mobile/main_widgets/main_header_konsultasi_praktisi_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainKonsultasiPraktisiBio extends StatefulWidget {
  final ConsultantListModel? consultant;
  const MainKonsultasiPraktisiBio(
    this.id,
    {
    Key? key,
    this.consultant,
  }) : super(key: key);
  final int?id;

  @override
  State<MainKonsultasiPraktisiBio> createState() => _MainKonsultasiPraktisiBioState();
}

class _MainKonsultasiPraktisiBioState extends State<MainKonsultasiPraktisiBio> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const MainCustomAppBarTitle(
        title: "Konsultasi",
        titleStyle: TextStyle(
          color: MainColorData.black,
          fontSize: MainSizeData.SIZE_16,
          fontWeight: FontWeight.bold,
        ),
        color: MainColorData.green_dop3,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderKonsultasiPraktisi(
                itemImage: "assets/images/example_praktisi.jpg",
                itemName: "Aksal Syah Falah.P.Si",
                itemKategori: "Kesehatan Mental",
                itemExperience: "7",
                itemSK: "446.1/0445/01.DPMPTSP/OL/2021",
                size: size),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: MainSizeData.SIZE_18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Deskripsi",
                    style: TextStyle(
                      fontSize: MainSizeData.SIZE_18,
                      fontWeight: FontWeight.bold,
                      color: MainColorData.black,
                    ),
                  ),
                  SizedBox(
                    height: MainSizeData.SIZE_8,
                  ),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla eu mauris ut lectus finibus vulputate sed sit amet nunc. ',
                    style: TextStyle(
                        fontSize: MainSizeData.SIZE_14,
                        fontWeight: FontWeight.w300,
                        color: MainColorData.black),
                  ),
                  SizedBox(
                    height: MainSizeData.SIZE_10,
                  ),
                  Text(
                    "Informasi Tambahan",
                    style: TextStyle(
                      fontSize: MainSizeData.SIZE_18,
                      fontWeight: FontWeight.bold,
                      color: MainColorData.black,
                    ),
                  ),
                  SizedBox(
                    height: MainSizeData.SIZE_6,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset("assets/icons/ic_specialist.svg",
                          width: MainSizeData.SIZE_14,
                          height: MainSizeData.SIZE_14),
                      SizedBox(width: MainSizeData.SIZE_12),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: MainSizeData.SIZE_5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Spesialis",
                              style: TextStyle(
                                  fontSize: MainSizeData.SIZE_14,
                                  fontWeight: FontWeight.bold,
                                  color: MainColorData.black),
                            ),
                            Text(
                              "Perawatan Kesehatan Mental, Psikolog",
                              style: TextStyle(
                                  fontSize: MainSizeData.fontSize14,
                                  fontWeight: FontWeight.normal,
                                  color: MainColorData.black),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                   SizedBox(
                    height: MainSizeData.SIZE_6,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset("assets/icons/ic_place_of_practice.svg",
                          width: MainSizeData.SIZE_14,
                          height: MainSizeData.SIZE_14),
                      SizedBox(width: MainSizeData.SIZE_12),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: MainSizeData.SIZE_5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Tempat Praktik",
                              style: TextStyle(
                                  fontSize: MainSizeData.SIZE_14,
                                  fontWeight: FontWeight.bold,
                                  color: MainColorData.black),
                            ),
                            Text(
                              "Rumah Sakit UNS",
                              style: TextStyle(
                                  fontSize: MainSizeData.fontSize14,
                                  fontWeight: FontWeight.normal,
                                  color: MainColorData.black),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                   SizedBox(
                    height: MainSizeData.SIZE_6,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset("assets/icons/ic_graduate.svg",
                          width: MainSizeData.SIZE_14,
                          height: MainSizeData.SIZE_14),
                      SizedBox(width: MainSizeData.SIZE_12),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: MainSizeData.SIZE_5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Pendidikan Terakhir",
                              style: TextStyle(
                                  fontSize: MainSizeData.SIZE_14,
                                  fontWeight: FontWeight.bold,
                                  color: MainColorData.black),
                            ),
                            Text(
                              "Psikologi, Universitas Sebelas Maret (2016)",
                              style: TextStyle(
                                  fontSize: MainSizeData.fontSize14,
                                  fontWeight: FontWeight.normal,
                                  color: MainColorData.black),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                   SizedBox(
                    height: MainSizeData.SIZE_6,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset("assets/icons/ic_experience.svg",
                          width: MainSizeData.SIZE_14,
                          height: MainSizeData.SIZE_14),
                      SizedBox(width: MainSizeData.SIZE_12),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: MainSizeData.SIZE_5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Pengalaman Kerja",
                              style: TextStyle(
                                  fontSize: MainSizeData.SIZE_14,
                                  fontWeight: FontWeight.bold,
                                  color: MainColorData.black),
                            ),
                            Container(
                              child: Text(
                                "Psikolog, UNS (2017-sekarang)",
                                style: TextStyle(
                                    fontSize: MainSizeData.fontSize14,
                                    fontWeight: FontWeight.normal,
                                    color: MainColorData.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding:EdgeInsets.symmetric(horizontal: MainSizeData.SIZE_30, vertical: MainSizeData.SIZE_20),
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                    onPressed: (){
                      Get.toNamed(MainConstantRoute.mainKonsultasiPraktisiForm);
                    },
                    child: Text(
                      'Mulai Konsultasi',
                      style: TextStyle(
                          fontSize: MainSizeData.SIZE_14,
                          fontWeight: FontWeight.w600,
                          color: MainColorData.white),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: MainColorData.green_dop3,
                        padding: EdgeInsets.symmetric(
                            horizontal: MainSizeData.SIZE_18,
                            vertical: MainSizeData.SIZE_8),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(MainSizeData.SIZE_12))),
                  ),
            )
          ],
        ),
      ),
    );
  }
}
