import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/route_manager.dart';
import 'package:skala_mobile/main_commons/main_color_data.dart';
import 'package:skala_mobile/main_commons/main_constant_route.dart';
import 'package:skala_mobile/main_commons/main_size_data.dart';
import 'package:skala_mobile/main_routes/Pages/ProfilePage/widgets/main_profile_photo_widget.dart';
import 'package:skala_mobile/main_widgets/main_custom_appbar_title_widget.dart';

class MainProfilePage extends StatelessWidget {
  const MainProfilePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: MainColorData.white,
        appBar: MainCustomAppBarTitle(
          title: 'Profile',
          isIconEnabled: false,
          titleStyle: const TextStyle(
              color: MainColorData.black,
              fontSize: MainSizeData.fontSize16,
              fontWeight: FontWeight.bold),
          action: IconButton(
            icon: SvgPicture.asset(
              'assets/icons/ic_signout.svg',
              height: MainSizeData.SIZE_14,
              width: MainSizeData.SIZE_16,
            ),
            onPressed: () {
            
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: MainSizeData.SIZE_20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: MainSizeData.SIZE_16,
                ),
                Center(child: MainProfilePhotoWidget(size: size)),
                const SizedBox(
                  height: MainSizeData.SIZE_16,
                ),
                Center(
                  child: Text(
                    "Fandy Ahmad Irianto",
                    style: TextStyle(
                        fontSize: MainSizeData.fontSize18,
                        fontWeight: FontWeight.bold,
                        color: MainColorData.grey75),
                  ),
                ),
                const SizedBox(height: MainSizeData.SIZE_16),
                const Divider(
                  color: MainColorData.green_dop,
                  height: MainSizeData.SIZE_10,
                  thickness: MainSizeData.SIZE_4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Data Akun",
                      style: TextStyle(
                          fontSize: MainSizeData.fontSize18,
                          fontWeight: FontWeight.bold,
                          color: MainColorData.green_dop),
                    ),
                    SizedBox(
                      width: MainSizeData.SIZE_80,
                    ),
                    IconButton(
                        onPressed: () {
                            Get.toNamed(MainConstantRoute.mainEditProfile);
                        },
                        icon: Icon(
                          Icons.edit,
                          size: MainSizeData.SIZE_25,
                          color: MainColorData.green_dop,
                        ))
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "NAMA LENGKAP",
                      style: TextStyle(
                          fontSize: MainSizeData.fontSize12,
                          fontWeight: FontWeight.bold,
                          color: MainColorData.green_dop),
                    ),
                    SizedBox(height: MainSizeData.SIZE_10),
                    Text(
                      "FANDY AHMAD IRIANTO",
                      style: TextStyle(
                          fontSize: MainSizeData.fontSize12,
                          fontWeight: FontWeight.bold,
                          color: MainColorData.grey75),
                    ),
                    SizedBox(height: MainSizeData.SIZE_12),
                    Text(
                      "NIK",
                      style: TextStyle(
                          fontSize: MainSizeData.fontSize12,
                          fontWeight: FontWeight.bold,
                          color: MainColorData.green_dop),
                    ),
                    SizedBox(height: MainSizeData.SIZE_10),
                    Text(
                      "BULUM ADA",
                      style: TextStyle(
                          fontSize: MainSizeData.fontSize12,
                          fontWeight: FontWeight.bold,
                          color: MainColorData.grey75),
                    ),
                    SizedBox(height: MainSizeData.SIZE_12),
                    Text(
                      "JENIS KELAMIN",
                      style: TextStyle(
                          fontSize: MainSizeData.fontSize12,
                          fontWeight: FontWeight.bold,
                          color: MainColorData.green_dop),
                    ),
                    SizedBox(height: MainSizeData.SIZE_10),
                    Text(
                      "LAKI LAKI",
                      style: TextStyle(
                          fontSize: MainSizeData.fontSize12,
                          fontWeight: FontWeight.bold,
                          color: MainColorData.grey75),
                    ),
                    SizedBox(height: MainSizeData.SIZE_12),
                    Text(
                      "TANGGAL LAHIR",
                      style: TextStyle(
                          fontSize: MainSizeData.fontSize12,
                          fontWeight: FontWeight.bold,
                          color: MainColorData.green_dop),
                    ),
                    SizedBox(height: MainSizeData.SIZE_10),
                    Text(
                      "23 MARET 2002",
                      style: TextStyle(
                          fontSize: MainSizeData.fontSize12,
                          fontWeight: FontWeight.bold,
                          color: MainColorData.grey75),
                    ),
                    SizedBox(height: MainSizeData.SIZE_12),
                    Text(
                      "NOMOR TELEPON/WA",
                      style: TextStyle(
                          fontSize: MainSizeData.fontSize12,
                          fontWeight: FontWeight.bold,
                          color: MainColorData.green_dop),
                    ),
                    SizedBox(height: MainSizeData.SIZE_10),
                    Text(
                      "086801482929",
                      style: TextStyle(
                          fontSize: MainSizeData.fontSize12,
                          fontWeight: FontWeight.bold,
                          color: MainColorData.grey75),
                    ),
                    SizedBox(height: MainSizeData.SIZE_12),
                    Text(
                      "EMAIL",
                      style: TextStyle(
                          fontSize: MainSizeData.fontSize12,
                          fontWeight: FontWeight.bold,
                          color: MainColorData.green_dop),
                    ),
                    SizedBox(height: MainSizeData.SIZE_10),
                    Text(
                      "FANDYAHMAD@REFACTORY.ID",
                      style: TextStyle(
                          fontSize: MainSizeData.fontSize12,
                          fontWeight: FontWeight.bold,
                          color: MainColorData.grey75),
                    ),
                    SizedBox(height: MainSizeData.SIZE_12),
                    Text(
                      "ALAMAT",
                      style: TextStyle(
                          fontSize: MainSizeData.fontSize12,
                          fontWeight: FontWeight.bold,
                          color: MainColorData.green_dop),
                    ),
                    SizedBox(height: MainSizeData.SIZE_10),
                    Text(
                      "BELUM ADA",
                      style: TextStyle(
                          fontSize: MainSizeData.fontSize12,
                          fontWeight: FontWeight.bold,
                          color: MainColorData.grey75),
                    ),
                    SizedBox(height: MainSizeData.SIZE_12),
                    Text(
                      "PEKERJAAN",
                      style: TextStyle(
                          fontSize: MainSizeData.fontSize12,
                          fontWeight: FontWeight.bold,
                          color: MainColorData.green_dop),
                    ),
                    SizedBox(height: MainSizeData.SIZE_10),
                    Text(
                      "BELUM ADA",
                      style: TextStyle(
                          fontSize: MainSizeData.fontSize12,
                          fontWeight: FontWeight.bold,
                          color: MainColorData.grey75),
                    ),
                    SizedBox(height: MainSizeData.SIZE_12),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
