import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skala_mobile/main_bloc/consultations/consultation_cubit.dart';
import 'package:skala_mobile/main_bloc/consultations/consultation_state.dart';
import 'package:skala_mobile/main_commons/main_color_data.dart';
import 'package:skala_mobile/main_commons/main_constant_route.dart';
import 'package:skala_mobile/main_commons/main_size_data.dart';
import 'package:skala_mobile/main_helpers/main_bloc_helper.dart';
import 'package:skala_mobile/main_helpers/main_validator_helper.dart';
import 'package:skala_mobile/main_models/main_consultant_list_model.dart';
import 'package:skala_mobile/main_prefs/prefs.dart';
import 'package:skala_mobile/main_routes/Pages/KonsultasiPage/main_konsultasi_page.dart';
import 'package:skala_mobile/main_services/main_firemessaging_service.dart';
import 'package:skala_mobile/main_widgets/main_custom_appbar_title_widget.dart';
import 'package:skala_mobile/main_widgets/main_custom_outlined_button_widget.dart';
import 'package:skala_mobile/main_widgets/main_custom_rounded_button.dart';
import 'package:skala_mobile/main_widgets/main_custom_text_area_widget.dart';
import 'package:skala_mobile/main_widgets/main_custom_text_field.dart';
import 'package:skala_mobile/main_widgets/main_header_konsultasi_praktisi_widget.dart';

class MainKonsultasiPraktisiForm extends StatefulWidget {
  const MainKonsultasiPraktisiForm({
    Key? key,
  }) : super(key: key);

  @override
  State<MainKonsultasiPraktisiForm> createState() =>
      _MainKonsultasiPraktisiFormState();
}

class _MainKonsultasiPraktisiFormState
    extends State<MainKonsultasiPraktisiForm> {
  final _prefs = Prefs();
  final _formKey = GlobalKey<FormState>();
  final String? _toUserId = Get.arguments?['id'];
  final String? id_consultant = Get.arguments?['id_consultation'];
  final String? name = Get.arguments?['name'];
  final String? consultant_category = Get.arguments?['consultant_category'];
  final String? notification_token = Get.arguments?['notification_token'];
  String? category() {
    switch (consultant_category) {
      case 'Kesehatan Mental':
        return "1";
      case 'Gizi Anak':
        return "2";
      case 'Kenakalan Remaja':
        return "3";
    }
  }

  final String? sk_number = Get.arguments?['sk_number'];
  final bool? isTampil = Get.arguments['isTampil'] ?? false;
  final int? work_experience_times = Get.arguments?['work_experience_times'];
  final _mainValidatorHelper = MainValidatorHelper();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  String? _imagePath;
  Uint8List? _image;

  void _fetch() {
    if (_prefs.roleId != 6) {
      context.read<ConsultationCubit>().getConsultationList();
    }
    context.read<ConsultationCubit>().getConsultationListUser();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocListener<ConsultationCubit, ConsultationState>(
        listenWhen: (previous, current) => current is ConsultationCreate,
        listener: (context, state) {
          if (state is ConsultationCreate) {
            blocHelperListenner(
              load: state.load,
              onSuccess: () => Get.toNamed(
                  MainConstantRoute.bottomNavigationBar,
                  arguments: {'index': 1}),
            );
          }
        },
        child: Scaffold(
          appBar: const MainCustomAppBarTitle(
            title: "Konsultasi",
            titleStyle: TextStyle(
              color: MainColorData.black,
              fontSize: MainSizeData.SIZE_16,
              fontWeight: FontWeight.bold,
            ),
            color: MainColorData.green_dop3,
          ),
          body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: _prefs.roleId != 6
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        isTampil!
                            ? HeaderKonsultasiPraktisi(
                                itemImage: "assets/images/example_praktisi.jpg",
                                itemName: name ?? '-',
                                itemKategori: consultant_category ?? '-',
                                itemWorkExperience: work_experience_times,
                                itemSK: sk_number,
                                size: size)
                            : SizedBox(),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: MainSizeData.SIZE_12),
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
                          onPressed: () async {
                            final ImagePicker _picker = ImagePicker();
                            final XFile? image = await _picker.pickImage(
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
                        const SizedBox(
                          height: MainSizeData.SIZE_16,
                        ),
                        Center(
                          child: MainCustomRoundedButton(
                            margin: const EdgeInsets.symmetric(
                              vertical: MainSizeData.SIZE_24,
                              horizontal: MainSizeData.SIZE_14,
                            ),
                            onPressed: () async {
                              if (_formKey.currentState?.validate() == true) {
                                FiremessagingService.sendNotification(
                                    _titleController.text,
                                    _descriptionController.text,
                                    notification_token.toString());
                                context
                                    .read<ConsultationCubit>()
                                    .createConsultation(
                                        description:
                                            _descriptionController.text,
                                        title: _titleController.text,
                                        image: _imagePath,
                                        toUserId: _toUserId);
                              }
                              _fetch();
                            },
                            text: "Kirim Konsultasi",
                          ),
                        )
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        isTampil!
                            ? HeaderKonsultasiPraktisi(
                                itemImage: "assets/images/example_praktisi.jpg",
                                itemName: name ?? '-',
                                itemKategori: consultant_category ?? '-',
                                itemWorkExperience: work_experience_times,
                                itemSK: sk_number,
                                size: size)
                            : SizedBox(),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: MainSizeData.SIZE_12),
                          child: Text(
                            "Balas",
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
                          onPressed: () async {
                            final ImagePicker _picker = ImagePicker();
                            final XFile? image = await _picker.pickImage(
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
                        const SizedBox(
                          height: MainSizeData.SIZE_16,
                        ),
                        Center(
                          child: MainCustomRoundedButton(
                            margin: const EdgeInsets.symmetric(
                              vertical: MainSizeData.SIZE_24,
                              horizontal: MainSizeData.SIZE_14,
                            ),
                            onPressed: () async {
                              if (_formKey.currentState?.validate() == true) {
                                FiremessagingService.sendNotification(
                                    _titleController.text,
                                    _descriptionController.text,
                                    notification_token.toString());
                                context
                                    .read<ConsultationCubit>()
                                    .answerConsultation(
                                        description:
                                            _descriptionController.text,
                                        title: _titleController.text,
                                        image: _imagePath,
                                        consultation_id: id_consultant);
                              }
                              _fetch();
                            },
                            text: "Kirim Konsultasi",
                          ),
                        )
                      ],
                    ),
            ),
          ),
        ));
  }
}
