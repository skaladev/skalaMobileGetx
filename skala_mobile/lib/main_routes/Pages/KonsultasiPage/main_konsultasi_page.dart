import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/route_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skala_mobile/main_bloc/konsultasi/konsultasi_cubit.dart';
import 'package:skala_mobile/main_bloc/konsultasi/kosultasi_state.dart';
import 'package:skala_mobile/main_commons/main_color_data.dart';
import 'package:skala_mobile/main_commons/main_constant_route.dart';
import 'package:skala_mobile/main_commons/main_size_data.dart';
import 'package:skala_mobile/main_helpers/main_bloc_helper.dart';
import 'package:skala_mobile/main_helpers/main_validator_helper.dart';
import 'package:skala_mobile/main_models/main_konsultasi_dummy_model.dart';
import 'package:skala_mobile/main_models/main_konsultasi_model.dart';
import 'package:skala_mobile/main_routes/Pages/KonsultasiPage/main_konsultasi_detail_page.dart';
import 'package:skala_mobile/main_widgets/main_custom_appbar_title_widget.dart';
import 'package:skala_mobile/main_widgets/main_custom_confirm_dialog.dart';
import 'package:skala_mobile/main_widgets/main_custom_consultation_card_widget.dart';
import 'package:skala_mobile/main_helpers/main_extensions_helper.dart';
import 'package:skala_mobile/main_widgets/main_custom_dropdown_button_widget.dart';
import 'package:skala_mobile/main_widgets/main_custom_outlined_button_widget.dart';
import 'package:skala_mobile/main_widgets/main_custom_rounded_button.dart';
import 'package:skala_mobile/main_widgets/main_custom_text_area_widget.dart';
import 'package:skala_mobile/main_widgets/main_custom_text_field.dart';

class MainKonsultasiPage extends StatefulWidget {
  const MainKonsultasiPage({Key? key}) : super(key: key);

  @override
  State<MainKonsultasiPage> createState() => _MainKonsultasiPageState();
}

class _MainKonsultasiPageState extends State<MainKonsultasiPage> {
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
    // _fetch();
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
              onSuccess: () {
                Get.toNamed(MainConstantRoute.mainRiwayatAduan);
              });
        }
      },
      child: Scaffold(
        backgroundColor: MainColorData.greybg,
        appBar: const MainCustomAppBarTitle(
          title: "Aduan",
          isIconEnabled: false,
          titleStyle: TextStyle(
            color: Color.fromARGB(255, 224, 147, 147),
            fontSize: MainSizeData.fontSize16,
            fontWeight: FontWeight.bold,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //card Riwayat Aduan
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: MainSizeData.SIZE_12,
                ),
                child: Container(
                  padding: const EdgeInsets.all(MainSizeData.SIZE_10),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 249, 195, 195),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/aduan.png',
                        height: MainSizeData.SIZE_150,
                        width: MainSizeData.SIZE_150,
                      ),
                      const SizedBox(
                        width: MainSizeData.SIZE_20,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Lihat Riwayat Aduan Anda Dibawah Ini !",
                              style: TextStyle(
                                fontSize: MainSizeData.fontSize16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: MainSizeData.SIZE_6,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Get.toNamed(MainConstantRoute.mainRiwayatAduan);
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Color.fromARGB(255, 227, 129, 129),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: MainSizeData.SIZE_18,
                                      vertical: MainSizeData.SIZE_8),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          MainSizeData.SIZE_12))),
                              child: Text(
                                'Riwayat Aduan',
                                style: TextStyle(
                                    fontSize: MainSizeData.SIZE_12,
                                    fontWeight: FontWeight.w600,
                                    color: MainColorData.white),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(MainConstantRoute.mainAduan);
                },
                child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(
                        horizontal: MainSizeData.SIZE_14),
                    padding: const EdgeInsets.symmetric(
                        vertical: MainSizeData.SIZE_10,
                        horizontal: MainSizeData.SIZE_20),
                    decoration: BoxDecoration(
                        color: MainColorData.white,
                        borderRadius: BorderRadius.circular(18)),
                    child: Row(
                      children: [
                        Icon(
                          Icons.announcement_outlined,
                          color: MainColorData.grey,
                        ),
                        SizedBox(
                          width: MainSizeData.SIZE_10,
                        ),
                        Flexible(
                          child: Text(
                            "Perhatikan cara menyampaikan pengaduan yang baik dan benar.",
                            style: TextStyle(
                              fontSize: MainSizeData.SIZE_12,
                              fontWeight: FontWeight.bold,
                              color: MainColorData.grey,
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
              Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: MainSizeData.SIZE_12),
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: _titleController,
                          validator: _mainValidatorHelper.validateBasic,
                          colorBorder: Color.fromARGB(255, 227, 129, 129),
                          label: "JUDUL",
                          margin: const EdgeInsets.symmetric(
                              horizontal: MainSizeData.SIZE_12,
                              vertical: MainSizeData.SIZE_10),
                        ),
                        BlocBuilder<KonsultasiCubit, KonsultasiState>(
                          buildWhen: (previous, current) =>
                              current is KategoriFetch,
                          builder: (context, state) {
                            if (state is KategoriFetch) {
                              return loadData(
                                state.load,
                                errorMessage: state.message,
                                child: Center(
                                  child: CustomDropdownButton2(
                                    label: "PILIH JENIS ADUAN",
                                    hint: "Pilih Salah Satu",
                                    borderColor:
                                        Color.fromARGB(255, 227, 129, 129),
                                    validator:
                                        _mainValidatorHelper.validateBasic,
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: MainSizeData.SIZE_12,
                                      vertical: MainSizeData.SIZE_10,
                                    ),
                                    customBuilder: state.data?.data
                                            ?.map((e) =>
                                                DropdownMenuItem<String>(
                                                  value: e.id?.toString(),
                                                  child: Text(
                                                    e.name ?? '-',
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                    style: const TextStyle(
                                                        fontSize: MainSizeData
                                                            .SIZE_14,
                                                        color:
                                                            MainColorData.black,
                                                        fontWeight:
                                                            FontWeight.w400),
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
                          borderColor: Color.fromARGB(255, 227, 129, 129),
                          margin: const EdgeInsets.symmetric(
                            horizontal: MainSizeData.SIZE_12,
                            vertical: MainSizeData.SIZE_10,
                          ),
                        ),
                        CustomOutlinedButton(
                          text: "TAMBAHKAN FOTO",
                          borderColor: Color.fromARGB(255, 227, 129, 129),
                          margin: const EdgeInsets.symmetric(
                              vertical: MainSizeData.SIZE_14,
                              horizontal: MainSizeData.SIZE_14),
                          borderWidth: 1,
                          textColor: Color.fromARGB(255, 227, 129, 129),
                          icon: const Icon(
                            Icons.add_a_photo,
                            color: Color.fromARGB(255, 227, 129, 129),
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
                        MainCustomRoundedButton(
                          color: Color.fromARGB(255, 227, 129, 129),
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
            ],
          ),
        ),
        // body: BlocConsumer<KonsultasiCubit, KonsultasiState>(
        //   listenWhen: (previous, current) => current is KonsultasiDelete,
        //   listener: (context, state) {
        //     if (state is KonsultasiDelete) {
        //       blocHelperListenner(
        //           load: state.load,
        //           onSuccess: () {
        //             _fetch();
        //           });
        //     }
        //   },
        //   buildWhen: (previous, current) => current is KonsultasiFetch,
        //   builder: (context, state) {
        //     if (state is KonsultasiFetch) {
        //       return loadData(
        //         state.load,
        //         errorMessage: state.message,
        //         child: (state.data?.data?.isEmpty ?? true)
        //             ? Center(
        //                 child: Container(
        //                   alignment: Alignment.center,
        //                   height: MainSizeData.imageHeight300,
        //                   decoration: BoxDecoration(
        //                       image: DecorationImage(
        //                           image: AssetImage('assets/images/404.png'),
        //                           fit: BoxFit.fitHeight)),
        //                 ),
        //               )
        //             : ListView.builder(
        //                 itemCount: state.data?.data?.length,
        //                 itemBuilder: (context, index) {
        //                   return _buildKonsultasiItem(
        //                     context,
        //                     state.data?.data?[index],
        //                   );
        //                 },
        //               ),
        //       );
        //     }
        //     return const SizedBox();
        //   },
        // ),
        // floatingActionButton: Padding(
        //   padding: const EdgeInsets.only(
        //       right: MainSizeData.SIZE_10, bottom: MainSizeData.SIZE_12),
        //   child: FloatingActionButton(
        //     onPressed: () {
        //       Get.toNamed(MainConstantRoute.mainAddKonsultasi);
        //     },
        //     child: const Icon(Icons.add),
        //     backgroundColor: MainColorData.green_dop,
        //   ),
        // ),
      ),
    );
  }

  // Widget _buildKonsultasiItem(
  //     BuildContext context, KonsultasiModelData? konsultasiDummy) {
  //   return MainConsultationCard(
  //     title: konsultasiDummy?.title,
  //     date: konsultasiDummy?.date?.ddMMMMyyyy(),
  //     time: konsultasiDummy?.time?.toString(),
  //     status: konsultasiDummy?.status.toString(),
  //     label: konsultasiDummy?.label.toString(),
  //     onDelete: () async {
  //       final res = await showDialog(
  //         context: context,
  //         builder: (ctx) => ConfirmDialogWidget(title: 'Hapus Aduan ?'),
  //       );
  //       if (res == true) {
  //         context
  //             .read<KonsultasiCubit>()
  //             .delete(konsultasiDummy?.id.toString() ?? '');
  //       }
  //     },
  //     onPressed: () async {
  //       final res = await Get.to(() => BlocProvider.value(
  //             value: context.read<KonsultasiCubit>(),
  //             child: MainKonsultasiDetailPage(
  //               konsultasiDummy?.id,
  //             ),
  //           ));
  //       if (res == true) {
  //         _fetch();
  //       }
  //     },
  //   );
  // }
}
