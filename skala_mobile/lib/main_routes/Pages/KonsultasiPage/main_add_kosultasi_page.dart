import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skala_mobile/main_commons/main_color_data.dart';
import 'package:skala_mobile/main_commons/main_size_data.dart';
import 'package:skala_mobile/main_helpers/main_validator_helper.dart';
import 'package:skala_mobile/main_widgets/main_custom_appbar_title_widget.dart';
import 'package:skala_mobile/main_widgets/main_custom_dropdown_button_widget.dart';
import 'package:skala_mobile/main_widgets/main_custom_outlined_button_widget.dart';
import 'package:skala_mobile/main_widgets/main_custom_rounded_button.dart';
import 'package:skala_mobile/main_widgets/main_custom_text_area_widget.dart';
import 'package:skala_mobile/main_widgets/main_custom_text_field.dart';

class MainAddKonsultasiPage extends StatefulWidget {
  MainAddKonsultasiPage({Key? key}) : super(key: key);

  @override
  State<MainAddKonsultasiPage> createState() => _MainAddKonsultasiPageState();
}

class _MainAddKonsultasiPageState extends State<MainAddKonsultasiPage> {
  final _mainValidatorHelper = MainValidatorHelper();
  final List<String> items = ['Kategori 1', 'Kategori 2', 'Kategori 3'];

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainCustomAppBarTitle(
        title: "Konsultasi",
        titleStyle: const TextStyle(
          color: MainColorData.black,
          fontSize: MainSizeData.SIZE_16,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: MainSizeData.SIZE_12),
          child: Column(
            children: [
              CustomTextField(
                validator: _mainValidatorHelper.validateBasic,
                label: "JUDUL",
                margin: EdgeInsets.symmetric(
                    horizontal: MainSizeData.SIZE_12,
                    vertical: MainSizeData.SIZE_10),
              ),
              Center(
                child: CustomDropdownButton2(
                  label: "KATEGORI KONSULTASI",
                  hint: "Pilih Salah Satu",
                  validator:_mainValidatorHelper.validateBasic,
                  margin: EdgeInsets.symmetric(
                    horizontal: MainSizeData.SIZE_12,
                    vertical: MainSizeData.SIZE_10,
                  ),
                  dropdownItems: items,
                  value: selectedValue,
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value;
                    });
                  },
                ),
              ),
              TextArea(
                label: "DESKRIPSI",
                hint: "Silahkan masukkan pesan",
                margin: EdgeInsets.symmetric(
                  horizontal: MainSizeData.SIZE_12,
                  vertical: MainSizeData.SIZE_10,
                ),
              ),
              CustomOutlinedButton(
                text: "TAMBAHKAN FOTO",
                margin: EdgeInsets.symmetric(
                    vertical: MainSizeData.SIZE_24,
                    horizontal: MainSizeData.SIZE_14),
                borderWidth: 1,
                icon: const Icon(
                  Icons.add_a_photo,
                  color: MainColorData.green_dop,
                  size: MainSizeData.SIZE_20,
                ),
                onPressed: () async {
                  final ImagePicker _picker = ImagePicker();
                  final XFile? imagePicker = await _picker.pickImage(
                      source: ImageSource.gallery,
                      maxHeight: 480,
                      maxWidth: 640,
                      imageQuality: 50);
                },
              ),
              MainCustomRoundedButton(
                  onPressed: () {},
                  margin: EdgeInsets.symmetric(
                      vertical: MainSizeData.SIZE_24,
                      horizontal: MainSizeData.SIZE_14),
                  text: "Kirim"),
            ],
          ),
        ),
      ),
    );
  }
}
