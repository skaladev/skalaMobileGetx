import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skala_mobile/main_bloc/konsultasi/konsultasi_cubit.dart';
import 'package:skala_mobile/main_bloc/konsultasi/kosultasi_state.dart';
import 'package:skala_mobile/main_commons/main_color_data.dart';
import 'package:skala_mobile/main_commons/main_size_data.dart';
import 'package:skala_mobile/main_helpers/main_bloc_helper.dart';
import 'package:skala_mobile/main_helpers/main_validator_helper.dart';
import 'package:skala_mobile/main_widgets/main_custom_appbar_title_widget.dart';
import 'package:skala_mobile/main_widgets/main_custom_dropdown_button_widget.dart';
import 'package:skala_mobile/main_widgets/main_custom_outlined_button_widget.dart';
import 'package:skala_mobile/main_widgets/main_custom_rounded_button.dart';
import 'package:skala_mobile/main_widgets/main_custom_text_area_widget.dart';
import 'package:skala_mobile/main_widgets/main_custom_text_field.dart';

class MainAddKonsultasiPage extends StatefulWidget {
  const MainAddKonsultasiPage({Key? key}) : super(key: key);

  @override
  State<MainAddKonsultasiPage> createState() => _MainAddKonsultasiPageState();
}

class _MainAddKonsultasiPageState extends State<MainAddKonsultasiPage> {
  final _formKey = GlobalKey<FormState>();
  final _mainValidatorHelper = MainValidatorHelper();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  String? selectedCategory;
  String? _imagePath;
  Uint8List? _image;

  void _fetch() {
    context.read<KonsultasiCubit>().getList();
  }

  @override
  void initState() {
    context.read<KonsultasiCubit>().getKategori();
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<KonsultasiCubit, KonsultasiState>(
      listenWhen: (previous, current) => current is KonsultasiCreate,
      listener: (context, state) {
        if (state is KonsultasiCreate) {
          blocHelperListenner(
            load: state.load,
            onSuccess: () => Get.back(result: true),
          );
        }
      },
      child: Scaffold(
        appBar: const MainCustomAppBarTitle(
          title: "Lapor",
          titleStyle: TextStyle(
            color: MainColorData.black,
            fontSize: MainSizeData.SIZE_16,
            fontWeight: FontWeight.bold,
          ),
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: MainSizeData.SIZE_12),
              child: Column(
                children: [
                  CustomTextField(
                    controller: _titleController,
                    validator: _mainValidatorHelper.validateBasic,
                    label: "JUDUL",
                    margin: const EdgeInsets.symmetric(
                        horizontal: MainSizeData.SIZE_12,
                        vertical: MainSizeData.SIZE_10),
                  ),
                  BlocBuilder<KonsultasiCubit, KonsultasiState>(
                    buildWhen: (previous, current) => current is KategoriFetch,
                    builder: (context, state) {
                      if (state is KategoriFetch) {
                        return loadData(
                          state.load,
                          errorMessage: state.message,
                          child: Center(
                            child: CustomDropdownButton2(
                              label: "KATEGORI KONSULTASI",
                              hint: "Pilih Salah Satu",
                              validator: _mainValidatorHelper.validateBasic,
                              margin: const EdgeInsets.symmetric(
                                horizontal: MainSizeData.SIZE_12,
                                vertical: MainSizeData.SIZE_10,
                              ),
                              // dropdownItems: state.data?.data
                              //         ?.map((e) => e.name ?? '')
                              //         .toList() ??
                              //     [],
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
                              value: selectedCategory,
                              onChanged: (value) {
                                setState(() {
                                  selectedCategory = value;
                                });
                              },
                            ),
                          ),
                        );
                      }
                      return const SizedBox();
                    },
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
                    text: "TAMBAHKAN FOTO",
                    margin: const EdgeInsets.symmetric(
                        vertical: MainSizeData.SIZE_24,
                        horizontal: MainSizeData.SIZE_14),
                    borderWidth: 1,
                    icon: const Icon(
                      Icons.add_a_photo,
                      color: MainColorData.green_dop,
                      size: MainSizeData.SIZE_20,
                    ),
                    onPressed: () async {
                      final ImagePicker picker = ImagePicker();
                      final XFile? image = await picker.pickImage(
                          source: ImageSource.gallery,
                          maxHeight: 480,
                          maxWidth: 640,
                          imageQuality: 50);
                      final img = await image?.readAsBytes();
                      setState(() {
                        _imagePath = image?.path;
                        _image = img;
                      });
                    },
                  ),
                  if (_image != null) Image.memory(_image!),
                  MainCustomRoundedButton(
                    margin: const EdgeInsets.symmetric(
                      vertical: MainSizeData.SIZE_24,
                      horizontal: MainSizeData.SIZE_14,
                    ),
                    onPressed: () async {
                      if (_formKey.currentState?.validate() == true) {
                        if (selectedCategory?.isEmpty ?? true) {
                          EasyLoading.showToast('Kategori belum dipilih');
                          return;
                        }
                        context.read<KonsultasiCubit>().createKonsultasi(
                              categoryId: selectedCategory,
                              description: _descriptionController.text,
                              title: _titleController.text,
                              image: _imagePath,
                            );
                      }
                      _fetch();
                    },
                    text: "Kirim",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
