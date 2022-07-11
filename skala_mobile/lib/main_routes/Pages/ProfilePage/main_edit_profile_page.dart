import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:skala_mobile/main_commons/main_color_data.dart';
import 'package:skala_mobile/main_commons/main_size_data.dart';
import 'package:skala_mobile/main_helpers/main_validator_helper.dart';
import 'package:skala_mobile/main_widgets/main_action_button_outline_widget.dart';
import 'package:skala_mobile/main_widgets/main_custom_appbar_title_widget.dart';
import 'package:skala_mobile/main_widgets/main_custom_datepicker_widget.dart';
import 'package:skala_mobile/main_widgets/main_custom_dropdown_button_widget.dart';
import 'package:skala_mobile/main_widgets/main_custom_radio_button.dart';
import 'package:skala_mobile/main_widgets/main_custom_rounded_button.dart';
import 'package:skala_mobile/main_widgets/main_custom_text_field.dart';

class MainEditProfilePage extends StatefulWidget {
  MainEditProfilePage({Key? key}) : super(key: key);

  @override
  State<MainEditProfilePage> createState() => _MainEditProfilePageState();
}

class _MainEditProfilePageState extends State<MainEditProfilePage> {
  final _mainValidatorHelper = MainValidatorHelper();
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
    'Item6',
    'Item7',
    'Item8',
  ];

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColorData.white,
      appBar: MainCustomAppBarTitle(
        title: 'Edit Profile',
        titleStyle: const TextStyle(
            color: MainColorData.black,
            fontSize: MainSizeData.fontSize16,
            fontWeight: FontWeight.bold),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MainSizeData.SIZE_12, vertical: MainSizeData.SIZE_14),
          child: Column(
            children: [
              CustomTextField(
                validator:_mainValidatorHelper.validateBasic ,
                label: "NAMA LENGKAP",
                margin: EdgeInsets.symmetric(
                    horizontal: MainSizeData.SIZE_12,
                    vertical: MainSizeData.SIZE_10),
              ),
              CustomTextField(
                validator: _mainValidatorHelper.validateNIK,
                label: "NIK",
                margin: EdgeInsets.symmetric(
                    horizontal: MainSizeData.SIZE_12,
                    vertical: MainSizeData.SIZE_10),
              ),
              MainCustomRadioButtom(
                label: "JENIS KELAMIN",
                margin: EdgeInsets.symmetric(
                    horizontal: MainSizeData.SIZE_12,
                    vertical: MainSizeData.SIZE_10),
              ),
              MainCustomDatePickerWidget(
                label: "TANGGAL LAHIR",
                margin: EdgeInsets.symmetric(
                    horizontal: MainSizeData.SIZE_12,
                    vertical: MainSizeData.SIZE_10),
              ),
              CustomTextField(
                validator: _mainValidatorHelper.validatePhoneNumber,
                label: "NO.HANDPHONE",
                margin: EdgeInsets.symmetric(
                    horizontal: MainSizeData.SIZE_12,
                    vertical: MainSizeData.SIZE_10),
              ),
              CustomTextField(
                validator: _mainValidatorHelper.validateEmail,
                label: "EMAIL",
                margin: EdgeInsets.symmetric(
                    horizontal: MainSizeData.SIZE_12,
                    vertical: MainSizeData.SIZE_10),
              ),
              Center(
                child: CustomDropdownButton2(
                  label: "KECAMATAN",
                  hint: 'Kecamatan',
                  margin: EdgeInsets.symmetric(
                      horizontal: MainSizeData.SIZE_12,
                      vertical: MainSizeData.SIZE_10),
                  dropdownItems: items,
                  value: selectedValue,
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value;
                    });
                  },
                ),
              ),
              CustomTextField(
                validator: _mainValidatorHelper.validateBasic,
                label: "PEKERJAAN",
                margin: EdgeInsets.symmetric(
                    horizontal: MainSizeData.SIZE_12,
                    vertical: MainSizeData.SIZE_10),
              ),
              SizedBox(
                height: MainSizeData.SIZE_12,
              ),
              MainCustomRoundedButton(
                onPressed: () {},
                text: "SIMPAN",
                margin: EdgeInsets.symmetric(
                    horizontal: MainSizeData.SIZE_12,
                    vertical: MainSizeData.SIZE_10),
              )
            ],
          ),
        ),
      ),
    );
  }
}
