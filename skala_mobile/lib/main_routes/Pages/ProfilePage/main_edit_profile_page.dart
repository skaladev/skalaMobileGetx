import 'dart:typed_data';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:skala_mobile/main_bloc/profile/profile_cubit.dart';
import 'package:skala_mobile/main_bloc/ref/ref_cubit.dart';
import 'package:skala_mobile/main_commons/main_color_data.dart';
import 'package:skala_mobile/main_commons/main_constant_key.dart';
import 'package:skala_mobile/main_commons/main_size_data.dart';
import 'package:skala_mobile/main_helpers/main_bloc_helper.dart';
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
  final _formKey = GlobalKey<FormState>();
  final String? id = Get.arguments?['id'];
  final _namaController = TextEditingController();
  final _nikController = TextEditingController();
  final _noWhashappController = TextEditingController();
  final _mainValidatorHelper = MainValidatorHelper();
  String _jenisKelamin = 'F';
  DateTime? _tanggalLahir;
  final _professionController = TextEditingController();
  final _professionCompanyController = TextEditingController();
  final _professionStartYearController = TextEditingController();
  final _professionEndYearController = TextEditingController();
  String? _province;
  String? _regency;
  String? _district;
  String? _subDistrict;
  String? _imagePath;
  Uint8List? _image;

  @override
  void initState() {
    context.read<RefCubit>().getProvince();
    _jenisKelamin =
        (Get.arguments?['jenisKelamin'] ?? 'Laki-Laki') == 'Laki-Laki'
            ? 'M'
            : 'F';
    _namaController.text = Get.arguments?['nama'] ?? '';
    _professionController.text = Get.arguments?['pekerjaan'] ?? '';
    _nikController.text = Get.arguments?['nik'] ?? '';
    _noWhashappController.text = Get.arguments?['phone'] ?? '';
    super.initState();
  }

  @override
  void dispose() {
    _namaController.dispose();
    _professionController.dispose();
    _nikController.dispose();
    _noWhashappController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColorData.white,
      appBar: const MainCustomAppBarTitle(
        title: 'Edit Profile',
        titleStyle: const TextStyle(
            color: MainColorData.black,
            fontSize: MainSizeData.fontSize16,
            fontWeight: FontWeight.bold),
      ),
      body: BlocListener<ProfileCubit, ProfileState>(
        listenWhen: (previous, current) => current is ProfileUpdate,
        listener: (context, state) {
          if (state is ProfileUpdate) {
            blocHelperListenner(
              load: state.load,
              onSuccess: () {
                Get.back(result: true);
              },
            );
          }
        },
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MainSizeData.SIZE_12,
                  vertical: MainSizeData.SIZE_14),
              child: Column(
                children: [
                  CustomTextField(
                    validator: _mainValidatorHelper.validateBasic,
                    label: "NAMA LENGKAP",
                    controller: _namaController,
                    margin: EdgeInsets.symmetric(
                        horizontal: MainSizeData.SIZE_12,
                        vertical: MainSizeData.SIZE_10),
                  ),
                  CustomTextField(
                    validator: _mainValidatorHelper.validateNIK,
                    label: "NIK",
                    controller: _nikController,
                    margin: EdgeInsets.symmetric(
                        horizontal: MainSizeData.SIZE_12,
                        vertical: MainSizeData.SIZE_10),
                  ),
                  MainCustomRadioButtom(
                    label: "JENIS KELAMIN",
                    margin: const EdgeInsets.symmetric(
                      horizontal: MainSizeData.SIZE_12,
                      vertical: MainSizeData.SIZE_10,
                    ),
                    groupValue: _jenisKelamin,
                    onChanged: (value) {
                      if (value?.isNotEmpty ?? false) {
                        setState(() {
                          _jenisKelamin = value!;
                        });
                      }
                    },
                  ),
                  MainCustomDatePickerWidget(
                    label: "TANGGAL LAHIR",
                    date: _tanggalLahir,
                    onChanged: (value) {
                      setState(() {
                        _tanggalLahir = value;
                      });
                    },
                    margin: EdgeInsets.symmetric(
                        horizontal: MainSizeData.SIZE_12,
                        vertical: MainSizeData.SIZE_10),
                  ),
                  BlocBuilder<RefCubit, RefState>(
                    buildWhen: (previous, current) => current is ProvinceFetch,
                    builder: (context, state) {
                      if (state is ProvinceFetch) {
                        return loadData(
                          state.load,
                          errorMessage: state.message,
                          child: Center(
                            child: CustomDropdownButton2(
                              label: "Provinsi",
                              hint: 'Provinsi',
                              margin: const EdgeInsets.symmetric(
                                  horizontal: MainSizeData.SIZE_12,
                                  vertical: MainSizeData.SIZE_10),
                              value: _province,
                              customBuilder: state.data?.data
                                      ?.map((e) => DropdownMenuItem<String>(
                                            value: e.id?.toString(),
                                            child: Text(
                                              e.name ?? '-',
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: const TextStyle(
                                                  fontSize:
                                                      MainSizeData.SIZE_14,
                                                  color: MainColorData.black,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ))
                                      .toList() ??
                                  [],
                              onChanged: (value) {
                                setState(() {
                                  _province = value;
                                  _regency = null;
                                  _district = null;
                                  _subDistrict = null;
                                  context
                                      .read<RefCubit>()
                                      .getRegency(_province ?? '');
                                });
                              },
                            ),
                          ),
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                  BlocBuilder<RefCubit, RefState>(
                    buildWhen: (previous, current) => current is RegencyFetch,
                    builder: (context, state) {
                      if (_province?.isEmpty ?? true) return const SizedBox();
                      if (state is RegencyFetch) {
                        return loadData(
                          state.load,
                          errorMessage: state.message,
                          child: Center(
                            child: CustomDropdownButton2(
                              label: "Kabupaten",
                              hint: 'Kabupaten',
                              margin: const EdgeInsets.symmetric(
                                  horizontal: MainSizeData.SIZE_12,
                                  vertical: MainSizeData.SIZE_10),
                              value: _regency,
                              customBuilder: state.data?.data
                                      ?.map((e) => DropdownMenuItem<String>(
                                            value: e.id?.toString(),
                                            child: Text(
                                              e.name ?? '-',
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: const TextStyle(
                                                  fontSize:
                                                      MainSizeData.SIZE_14,
                                                  color: MainColorData.black,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ))
                                      .toList() ??
                                  [],
                              onChanged: (value) {
                                setState(() {
                                  _regency = value;
                                  _district = null;
                                  _subDistrict = null;
                                  context
                                      .read<RefCubit>()
                                      .getDistrict(_regency ?? '');
                                });
                              },
                            ),
                          ),
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                  BlocBuilder<RefCubit, RefState>(
                    buildWhen: (previous, current) => current is DistrictFetch,
                    builder: (context, state) {
                      if (_regency?.isEmpty ?? true) return const SizedBox();
                      if (state is DistrictFetch) {
                        return loadData(
                          state.load,
                          errorMessage: state.message,
                          child: Center(
                            child: CustomDropdownButton2(
                              label: "KECAMATAN",
                              hint: 'Kecamatan',
                              margin: const EdgeInsets.symmetric(
                                  horizontal: MainSizeData.SIZE_12,
                                  vertical: MainSizeData.SIZE_10),
                              value: _district,
                              customBuilder: state.data?.data
                                      ?.map((e) => DropdownMenuItem<String>(
                                            value: e.id?.toString(),
                                            child: Text(
                                              e.name ?? '-',
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: const TextStyle(
                                                  fontSize:
                                                      MainSizeData.SIZE_14,
                                                  color: MainColorData.black,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ))
                                      .toList() ??
                                  [],
                              onChanged: (value) {
                                setState(() {
                                  _district = value;
                                  _subDistrict = null;
                                  context
                                      .read<RefCubit>()
                                      .getSubDistrict(_district ?? '');
                                });
                              },
                            ),
                          ),
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                  BlocBuilder<RefCubit, RefState>(
                    buildWhen: (previous, current) =>
                        current is SubDistrictFetch,
                    builder: (context, state) {
                      if (_district?.isEmpty ?? true) return const SizedBox();
                      if (state is SubDistrictFetch) {
                        return loadData(
                          state.load,
                          errorMessage: state.message,
                          child: Center(
                            child: CustomDropdownButton2(
                              label: "Kelurahan",
                              hint: 'Kelurahan',
                              margin: const EdgeInsets.symmetric(
                                  horizontal: MainSizeData.SIZE_12,
                                  vertical: MainSizeData.SIZE_10),
                              value: _subDistrict,
                              customBuilder: state.data?.data
                                      ?.map((e) => DropdownMenuItem<String>(
                                            value: e.id?.toString(),
                                            child: Text(
                                              e.name ?? '-',
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: const TextStyle(
                                                  fontSize:
                                                      MainSizeData.SIZE_14,
                                                  color: MainColorData.black,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ))
                                      .toList() ??
                                  [],
                              onChanged: (value) {
                                setState(() {
                                  _subDistrict = value;
                                  context
                                      .read<RefCubit>()
                                      .getSubDistrict(_district ?? '');
                                });
                              },
                            ),
                          ),
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                  CustomTextField(
                    validator: _mainValidatorHelper.validateBasic,
                    label: "PEKERJAAN",
                    controller: _professionController,
                    margin: EdgeInsets.symmetric(
                        horizontal: MainSizeData.SIZE_12,
                        vertical: MainSizeData.SIZE_10),
                  ),
                  CustomTextField(
                    validator: _mainValidatorHelper.validateBasic,
                    label: "SEKOLAH/PERGURIAN TINGGI/TEMPAT KERJA",
                    controller: _professionCompanyController,
                    margin: EdgeInsets.symmetric(
                        horizontal: MainSizeData.SIZE_12,
                        vertical: MainSizeData.SIZE_10),
                  ),
                
                  CustomTextField(
                    validator: _mainValidatorHelper.validateBasic,
                    label: "TAHUN MASUK",
                    controller: _professionStartYearController,
                    margin: EdgeInsets.symmetric(
                        horizontal: MainSizeData.SIZE_12,
                        vertical: MainSizeData.SIZE_10),
                  ),
                
                  CustomTextField(
                    validator: _mainValidatorHelper.validateBasic,
                    label: "TAHUN BERAKHIR",
                    controller: _professionEndYearController,
                    margin: EdgeInsets.symmetric(
                        horizontal: MainSizeData.SIZE_12,
                        vertical: MainSizeData.SIZE_10),
                  ),
                  SizedBox(
                    height: MainSizeData.SIZE_12,
                  ),
                  MainCustomRoundedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() == true) {
                        context.read<ProfileCubit>().updateProfile(
                              name: _namaController.text,
                              nik: _nikController.text,
                              gender: _jenisKelamin,
                              tanggalLahir: _tanggalLahir == null
                                  ? null
                                  : '${_tanggalLahir?.year}-${_tanggalLahir?.month}-${_tanggalLahir?.day}',
                              regency: _regency,
                              district: _district,
                              subDistrict: _subDistrict,
                              profession: _professionController.text,
                              proffesionCompany: _professionCompanyController.text,
                              proffesionStartYear: _professionStartYearController.text,
                              proffesionEndYear: _professionEndYearController.text,
                              
                              id: id,
                            );
                      }
                    },
                    text: "SIMPAN",
                    margin: EdgeInsets.symmetric(
                        horizontal: MainSizeData.SIZE_12,
                        vertical: MainSizeData.SIZE_10),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
