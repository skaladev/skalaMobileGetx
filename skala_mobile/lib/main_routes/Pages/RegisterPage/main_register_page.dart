import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:skala_mobile/main_bloc/auth/auth_cubit.dart';
import 'package:skala_mobile/main_commons/main_color_data.dart';
import 'package:skala_mobile/main_commons/main_constant_data.dart';
import 'package:skala_mobile/main_commons/main_constant_route.dart';
import 'package:skala_mobile/main_commons/main_size_data.dart';
import 'package:skala_mobile/main_controllers/main_register_controller.dart';
import 'package:skala_mobile/main_helpers/main_bloc_helper.dart';
import 'package:skala_mobile/main_helpers/main_validator_helper.dart';
import 'package:skala_mobile/main_widgets/main_already_have_an_account_check.dart';
import 'package:skala_mobile/main_widgets/main_custom_datepicker_widget.dart';
import 'package:skala_mobile/main_widgets/main_custom_radio_button.dart';
import 'package:skala_mobile/main_widgets/main_custom_rounded_button.dart';
import 'package:skala_mobile/main_widgets/main_custom_text_field.dart';

class MainRegisterPage extends StatefulWidget {
  MainRegisterPage({Key? key}) : super(key: key);

  @override
  State<MainRegisterPage> createState() => _MainRegisterPageState();
}

class _MainRegisterPageState extends State<MainRegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _mainValidatorHelper = MainValidatorHelper();

  final _namaController = TextEditingController();
  final _phoneController = TextEditingController();
  final _nikController = TextEditingController();
  DateTime? _tanggalLahir;
  String _jenisKelamin = "M";

  @override
  void dispose() {
    _namaController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthRegister) {
          blocHelperListenner(
              load: state.load,
              onSuccess: () {
                Get.toNamed(MainConstantRoute.mainLogin);
              });
        }
      },
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: MainSizeData.SIZE_12),
                  child: Form(
                    key: _formKey,
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
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.15),
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
                          validator: _mainValidatorHelper.validatePhoneNumber,
                          controller: _phoneController,
                          errorMessage: MainConstantData.required,
                          label: "NO WHATSAPP",
                          hint: "no.whatsapp",
                          margin: EdgeInsets.symmetric(
                              horizontal: MainSizeData.SIZE_12),
                        ),
                        SizedBox(
                          height: MainSizeData.SIZE_16,
                        ),
                        CustomTextField(
                          validator: _mainValidatorHelper.validateNIK,
                          controller: _nikController,
                          errorMessage: MainConstantData.required,
                          label: "NIK",
                          hint: "nik",
                          margin: EdgeInsets.symmetric(
                              horizontal: MainSizeData.SIZE_12),
                        ),
                        SizedBox(
                          height: MainSizeData.SIZE_16,
                        ),
                        CustomTextField(
                          validator: _mainValidatorHelper.validateBasic,
                          controller: _namaController,
                          errorMessage: MainConstantData.required,
                          label: "NAMA LENGKAP",
                          hint: "nama lengkap",
                          margin: EdgeInsets.symmetric(
                              horizontal: MainSizeData.SIZE_12),
                        ),
                        SizedBox(
                          height: MainSizeData.SIZE_16,
                        ),
                        MainCustomDatePickerWidget(
                          onChanged: (value){
                            setState(() {
                              _tanggalLahir = value;
                            });
                          },
                          date: _tanggalLahir,
                          label: "TANGGAL LAHIR",
                          margin: EdgeInsets.symmetric(
                              horizontal: MainSizeData.SIZE_12),
                        ),
                        SizedBox(
                          height: MainSizeData.SIZE_10,
                        ),
                        Row(children: [
                          MainCustomRadioButtom(
                            label: "JENIS KELAMIN",
                            margin: EdgeInsets.symmetric(
                                horizontal: MainSizeData.SIZE_12,
                                vertical: MainSizeData.SIZE_10),
                            groupValue: _jenisKelamin,
                            onChanged: (value) {
                              if(value?.isNotEmpty?? false){
                                setState(() {
                                  _jenisKelamin = value!;
                                });
                              }
                            },
                          ),
                        ]),
                        SizedBox(
                          height: MainSizeData.SIZE_16,
                        ),
                        MainCustomRoundedButton(
                          margin: EdgeInsets.zero,
                          text: "REGISTER",
                          onPressed: (){
                            if(_formKey.currentState?.validate() == true){
                              context.read<AuthCubit>().register(
                                phone: _phoneController.text,
                                name: _namaController.text,
                                nik:_nikController.text,
                                gender: _jenisKelamin,
                                tanggalLahir:   '${_tanggalLahir?.year}-${_tanggalLahir?.month}-${_tanggalLahir?.day}',
                              );
                            }
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
