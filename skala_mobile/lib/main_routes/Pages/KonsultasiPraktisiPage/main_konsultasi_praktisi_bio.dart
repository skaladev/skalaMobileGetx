import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:skala_mobile/main_bloc/consultations/consultation_cubit.dart';
import 'package:skala_mobile/main_bloc/consultations/consultation_state.dart';
import 'package:skala_mobile/main_commons/main_color_data.dart';
import 'package:skala_mobile/main_commons/main_constant_route.dart';
import 'package:skala_mobile/main_commons/main_size_data.dart';
import 'package:skala_mobile/main_helpers/main_bloc_helper.dart';
import 'package:skala_mobile/main_models/main_consultant_list_model.dart';
import 'package:skala_mobile/main_routes/Pages/KonsultasiPraktisiPage/main_konsultasi_praktisi_form_page.dart';
import 'package:skala_mobile/main_widgets/main_custom_appbar_title_widget.dart';
import 'package:skala_mobile/main_widgets/main_header_konsultasi_praktisi_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainKonsultasiPraktisiBio extends StatefulWidget {
  final ConsultantListModel? consultant;
  const MainKonsultasiPraktisiBio(
    this.id, {
    Key? key,
    this.consultant,
  }) : super(key: key);
  final int? id;

  @override
  State<MainKonsultasiPraktisiBio> createState() =>
      _MainKonsultasiPraktisiBioState();
}

class _MainKonsultasiPraktisiBioState extends State<MainKonsultasiPraktisiBio> {
  @override
  void _fetch() {
    context.read<ConsultationCubit>().getConsultant(widget.id.toString());
  }

  void initState(){
    _fetch();
    super.initState();
  }


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
      body: BlocBuilder<ConsultationCubit, ConsultationState>(
        buildWhen: (previous, current) => current is ConsultantFetch,
        builder: (context, state) {
          if (state is ConsultantFetch) {
            return loadData(
              state.load,
              errorMessage: state.message,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeaderKonsultasiPraktisi(
                        itemImage: "assets/images/user.png",
                        itemName: state.data?.data?.name ?? '-',
                        itemKategori:  state.data?.data?.consultantCategory ?? '-',
                        itemWorkExperience: state.data?.data?.workExperienceTimes ,
                        itemSK: state.data?.data?.skNumber ?? '-',
                        size: size),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: MainSizeData.SIZE_18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Deskripsi",
                            style: TextStyle(
                              fontSize: MainSizeData.SIZE_18,
                              fontWeight: FontWeight.bold,
                              color: MainColorData.black,
                            ),
                          ),
                          SizedBox(
                            height: MainSizeData.SIZE_8,
                          ),
                          Text(
                            state.data?.data?.description ?? '-',
                            style: TextStyle(
                                fontSize: MainSizeData.SIZE_14,
                                fontWeight: FontWeight.w300,
                                color: MainColorData.black),
                          ),
                          SizedBox(
                            height: MainSizeData.SIZE_10,
                          ),
                          Text(
                            "Informasi Tambahan",
                            style: TextStyle(
                              fontSize: MainSizeData.SIZE_18,
                              fontWeight: FontWeight.bold,
                              color: MainColorData.black,
                            ),
                          ),
                          SizedBox(
                            height: MainSizeData.SIZE_6,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset("assets/icons/ic_specialist.svg",
                                  width: MainSizeData.SIZE_14,
                                  height: MainSizeData.SIZE_14),
                              SizedBox(width: MainSizeData.SIZE_12),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: MainSizeData.SIZE_5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Spesialis",
                                      style: TextStyle(
                                          fontSize: MainSizeData.SIZE_14,
                                          fontWeight: FontWeight.bold,
                                          color: MainColorData.black),
                                    ),
                                    Text(
                                      state.data?.data?.specialities ?? '-',
                                      style: TextStyle(
                                          fontSize: MainSizeData.fontSize14,
                                          fontWeight: FontWeight.normal,
                                          color: MainColorData.black),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MainSizeData.SIZE_6,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                  "assets/icons/ic_place_of_practice.svg",
                                  width: MainSizeData.SIZE_14,
                                  height: MainSizeData.SIZE_14),
                              SizedBox(width: MainSizeData.SIZE_12),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: MainSizeData.SIZE_5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Tempat Praktik",
                                      style: TextStyle(
                                          fontSize: MainSizeData.SIZE_14,
                                          fontWeight: FontWeight.bold,
                                          color: MainColorData.black),
                                    ),
                                    Text(
                                      state.data?.data?.placeOfPractice ?? '-',
                                      style: TextStyle(
                                          fontSize: MainSizeData.fontSize14,
                                          fontWeight: FontWeight.normal,
                                          color: MainColorData.black),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MainSizeData.SIZE_6,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset("assets/icons/ic_graduate.svg",
                                  width: MainSizeData.SIZE_14,
                                  height: MainSizeData.SIZE_14),
                              SizedBox(width: MainSizeData.SIZE_12),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: MainSizeData.SIZE_5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Pendidikan Terakhir",
                                      style: TextStyle(
                                          fontSize: MainSizeData.SIZE_14,
                                          fontWeight: FontWeight.bold,
                                          color: MainColorData.black),
                                    ),
                                    Text(
                                      state.data?.data?.graduateFaculty ?? "-" ,
                                      style: TextStyle(
                                          fontSize: MainSizeData.fontSize14,
                                          fontWeight: FontWeight.normal,
                                          color: MainColorData.black),
                                    ),
                                     Text(
                                      state.data?.data?.graduateUniversity ?? "-" ,
                                      style: TextStyle(
                                          fontSize: MainSizeData.fontSize14,
                                          fontWeight: FontWeight.normal,
                                          color: MainColorData.black),
                                    ),
                                     Text(
                                      state.data?.data?.graduateYear ?? "-" ,
                                      style: TextStyle(
                                          fontSize: MainSizeData.fontSize14,
                                          fontWeight: FontWeight.normal,
                                          color: MainColorData.black),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MainSizeData.SIZE_6,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset("assets/icons/ic_experience.svg",
                                  width: MainSizeData.SIZE_14,
                                  height: MainSizeData.SIZE_14),
                              SizedBox(width: MainSizeData.SIZE_12),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: MainSizeData.SIZE_5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Pengalaman Kerja",
                                      style: TextStyle(
                                          fontSize: MainSizeData.SIZE_14,
                                          fontWeight: FontWeight.bold,
                                          color: MainColorData.black),
                                    ),
                                    Container(
                                      child: Text(
                                        "Psikolog, UNS (2017-sekarang)",
                                        style: TextStyle(
                                            fontSize: MainSizeData.fontSize14,
                                            fontWeight: FontWeight.normal,
                                            color: MainColorData.black),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: MainSizeData.SIZE_30,
                          vertical: MainSizeData.SIZE_20),
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                        onPressed: () async{
                          final res = await Get.toNamed(
                            MainConstantRoute.mainKonsultasiPraktisiForm,
                            arguments: {
                              'id'  : state.data?.data?.id?.toString(),
                              'name' : state.data?.data?.name,
                              'consultant_category': state.data?.data?.consultantCategory,
                              'work_experience_times': state.data?.data?.workExperienceTimes,
                              'sk_number': state.data?.data?.skNumber,
                              'isTampil': true
                            }
                          );
                          if(res== true){
                            if(!mounted) return;
                            context.read<ConsultationCubit>().getConsultant(widget.id.toString());
                          }
                        },
                        child: Text(
                          'Mulai Konsultasi',
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
                                borderRadius: BorderRadius.circular(
                                    MainSizeData.SIZE_12))),
                      ),
                    )
                  ],
                ),
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
