import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:skala_mobile/main_commons/main_color_data.dart';
import 'package:skala_mobile/main_commons/main_size_data.dart';
import 'package:skala_mobile/main_helpers/main_validator_helper.dart';
import 'package:skala_mobile/main_widgets/main_custom_appbar_title_widget.dart';
import 'package:skala_mobile/main_widgets/main_custom_outlined_button_widget.dart';
import 'package:skala_mobile/main_widgets/main_custom_text_area_widget.dart';
import 'package:skala_mobile/main_widgets/main_custom_text_field.dart';
import 'package:skala_mobile/main_widgets/main_header_konsultasi_praktisi_widget.dart';

class MainKonsultasiPraktisiForm extends StatefulWidget {
  const MainKonsultasiPraktisiForm({Key? key}) : super(key: key);

  @override
  State<MainKonsultasiPraktisiForm> createState() =>
      _MainKonsultasiPraktisiFormState();
}

class _MainKonsultasiPraktisiFormState
    extends State<MainKonsultasiPraktisiForm> {
  final _formKey = GlobalKey<FormState>();
  final _mainValidatorHelper = MainValidatorHelper();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  String? selectedCategory;
  String? _imagePath;
  Uint8List? _image;
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
              padding: const EdgeInsets.only(left: MainSizeData.SIZE_12),
              child: Text(
                "Silahkan isi form konsultasi !",
                style: TextStyle(
                  fontSize: MainSizeData.SIZE_18,
                  fontWeight: FontWeight.bold,
                  color: MainColorData.green_dop3,
                ),
              ),
            ),
            CustomTextField(
              controller: _titleController,
              validator: _mainValidatorHelper.validateBasic,
              label: "JUDUL",
              margin: const EdgeInsets.symmetric(
                  horizontal: MainSizeData.SIZE_12,
                  vertical: MainSizeData.SIZE_10),
            ),
            CustomTextField(
              controller: _titleController,
              validator: _mainValidatorHelper.validateBasic,
              label: "KATEGORI",
              margin: const EdgeInsets.symmetric(
                  horizontal: MainSizeData.SIZE_12,
                  vertical: MainSizeData.SIZE_10),
            ),
            TextArea(
              controller: _descriptionController,
              label: "DESKRIPSI",
              hint: "Silahkan masukkan pesan",
              margin: const EdgeInsets.symmetric(
                horizontal: MainSizeData.SIZE_12,
                vertical: MainSizeData.SIZE_10,
              ),
            ),
            CustomOutlinedButton(
              text: "TAMBAHKAN DOKUMEN",
              margin: const EdgeInsets.symmetric(
                  vertical: MainSizeData.SIZE_10,
                  horizontal: MainSizeData.SIZE_10),
              borderWidth: 1,
              icon: const Icon(
                Icons.add_a_photo,
                color: MainColorData.green_dop,
                size: MainSizeData.SIZE_20,
              ),
              onPressed: () {},
            ),
            SizedBox(height: MainSizeData.SIZE_16,),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: MainSizeData.SIZE_13,vertical: MainSizeData.SIZE_20),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Kirim Konsultasi',
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
