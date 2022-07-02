import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/route_manager.dart';
import 'package:skala_mobile/main_commons/main_color_data.dart';
import 'package:skala_mobile/main_commons/main_constant_data.dart';
import 'package:skala_mobile/main_commons/main_constant_route.dart';
import 'package:skala_mobile/main_commons/main_size_data.dart';
import 'package:skala_mobile/main_widgets/main_already_have_an_account_check.dart';
import 'package:skala_mobile/main_widgets/main_custom_datepicker_widget.dart';
import 'package:skala_mobile/main_widgets/main_custom_radio_button.dart';
import 'package:skala_mobile/main_widgets/main_custom_rounded_button.dart';
import 'package:skala_mobile/main_widgets/main_custom_text_field.dart';

class MainRegisterPage extends StatelessWidget {
  const MainRegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
              child: Column(children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: MainSizeData.SIZE_12),
          child: Column(
            children: [
              SizedBox(
                width: size.width * 0.3,
                child: Image.asset('assets/images/logo_skala2.png'),
              ),
              const SizedBox(
                height: MainSizeData.SIZE_16,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.15),
                child: const Text(
                  MainConstantData.appNames,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: MainColorData.green_dop,
                  ),
                ),
              ),
              const SizedBox(
                height: MainSizeData.SIZE_40,
              ),
              CustomTextField(
                label: "NO WHATSAPP",
                hint: "no.whatsapp",
                margin: EdgeInsets.symmetric(horizontal: MainSizeData.SIZE_12),
              ),
              SizedBox(
                height: MainSizeData.SIZE_16,
              ),
              CustomTextField(
                label: "NAMA LENGKAP",
                hint: "nama lengkap",
                margin: EdgeInsets.symmetric(horizontal: MainSizeData.SIZE_12),
              ),
              SizedBox(
                height: MainSizeData.SIZE_16,
              ),
              MainCustomDatePickerWidget(
                label: "TANGGAL LAHIR",
                // margin: EdgeInsets.symmetric(horizontal: MainSizeData.SIZE_12),
              ),
              SizedBox(
                height: MainSizeData.SIZE_10,
              ),
              Row(children: [
                MainCustomRadioButtom(
                  label: "JENIS KELAMIN",
                ),
              ]),
              SizedBox(
                height: MainSizeData.SIZE_16,
              ),
              MainCustomRoundedButton(
                margin: EdgeInsets.zero,
                text: "REGISTER",
                onPressed: () {
                  Get.toNamed(MainConstantRoute.verifyOtp);
                },
              ),
              SizedBox(
                height: MainSizeData.SIZE_14,
              ),
              MainAlreadyHaveAnAccountCheck(
                login: false,
                OnPressed: () {
                  Get.toNamed(MainConstantRoute.mainLogin);
                },
              ),
            ],
          ),
        ),
      ]))),
    );
  }
}
