import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:skala_mobile/main_bloc/consultations/consultation_cubit.dart';
import 'package:skala_mobile/main_bloc/consultations/consultation_state.dart';
import 'package:skala_mobile/main_commons/main_color_data.dart';
import 'package:skala_mobile/main_commons/main_constant_route.dart';
import 'package:skala_mobile/main_commons/main_size_data.dart';
import 'package:skala_mobile/main_helpers/main_bloc_helper.dart';
import 'package:skala_mobile/main_models/main_consultation_detail.dart';
import 'package:skala_mobile/main_models/main_consultation_model.dart';
import 'package:skala_mobile/main_prefs/prefs.dart';
import 'package:skala_mobile/main_widgets/main_custom_appbar_title_widget.dart';
import 'package:skala_mobile/main_widgets/main_custom_consultation_card_widget.dart';
import 'package:skala_mobile/main_widgets/main_custom_consutlation_detail_card_widget.dart';
import 'package:skala_mobile/main_widgets/main_header_konsultasi_praktisi_widget.dart';
import 'package:skala_mobile/main_helpers/main_extensions_helper.dart';

class MainKonsultasiPraktisiDetailPage extends StatefulWidget {
  final ConsultationModelData? consultation;
  const MainKonsultasiPraktisiDetailPage( {Key? key,this.id, this.consultation})
      : super(key: key);
  final int? id;
  @override
  State<MainKonsultasiPraktisiDetailPage> createState() =>
      _MainKonsultasiPraktisiDetailPageState();
}

class _MainKonsultasiPraktisiDetailPageState
    extends State<MainKonsultasiPraktisiDetailPage> {
  final _prefs = Prefs();
  final int? id_consultation = Get.arguments?['id'];
  @override
  void initState() {
    if (_prefs.roleId != 6) {
      context
          .read<ConsultationCubit>()
          .getDetailConsultation(id_consultation.toString());
    }
    context
        .read<ConsultationCubit>()
        .getDetailConsultationPraktisi(id: id_consultation);
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
      body: _prefs.roleId != 6
          ? Column(
              children: [
                BlocBuilder<ConsultationCubit, ConsultationState>(
                  buildWhen: (previous, current) =>
                      current is ConsultationDetailFetch,
                  builder: (context, state) {
                    if (state is ConsultationDetailFetch) {
                      return loadData(
                        state.load,
                        errorMessage: state.message,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              HeaderKonsultasiPraktisi(
                                  itemName: state.data?.data?.user?.name ?? "",
                                  itemKategori: state.data?.data?.user?.category ?? "",
                                  itemWorkExperience: state.data?.data?.user?.workExperienceTimes,
                                  itemImage: state.data?.data?.user?.imagePath ?? "",
                                  size: size),
                              
                              Column(
                                children: state.data?.data?.consultations
                                        ?.map(
                                          (e) => MainCustomConsultationDetailCardWidget(
                                            date: e.date?.ddMMMMyyyy() ?? "",
                                            title: e.title?.toString(),
                                            description: e.description,
                                            time: e.time,
                                            from_user: e.fromUser,
                                          ),
                                        )
                                        .toList() ??
                                    [],
                              )
                            ],
                          ),
                        ),
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ],
            )
          : Column(
              children: [
                BlocBuilder<ConsultationCubit, ConsultationState>(
                  buildWhen: (previous, current) =>
                      current is ConsultationDetailPraktisiFetch,
                  builder: (context, state) {
                    if (state is ConsultationDetailPraktisiFetch) {
                      return loadData(
                        state.load,
                        errorMessage: state.message,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              HeaderKonsultasiPraktisi(
                                  itemName: state.data?.data?.user?.name ?? "-",
                                  itemKategori:
                                      state.data?.data?.user?.profession ?? "-",
                                  subDestrict: state.data?.data?.user?.subDistrict ?? "",
                                  district: state.data?.data?.user?.district ?? "",
                                  regency: state.data?.data?.user?.regency ?? "",
                                  phone: state.data?.data?.user?.phone ?? "",
                                  itemImage: "assets/images/user.png",
                                  size: size),
                              Column(
                                children: state.data?.data?.consultations
                                        ?.map(
                                          (e) => MainConsultationCard(
                                            date: e.date?.ddMMMMyyyy() ?? "",
                                            title: e.title?.toString(),
                                            description: e.description,
                                            time: e.time,
                                            onPressed: () {},
                                          ),
                                        )
                                        .toList() ??
                                    [],
                              ),
                              const SizedBox(height: MainSizeData.SIZE_12),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: MainSizeData.SIZE_30,
                                    vertical: MainSizeData.SIZE_20),
                                alignment: Alignment.bottomRight,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    final res = await Get.toNamed(
                                        MainConstantRoute
                                            .mainKonsultasiPraktisiForm,
                                        arguments: {
                                          'id':
                                              state.data?.data?.user?.id.toString(),
                                          'id_consultation': id_consultation.toString(),
                                          'name': state.data?.data?.user?.name ?? "-",
                                          'profession': state
                                              .data?.data?.user?.profession ?? "-",
                                          // 'image_path': state
                                          //     .data?.data?.user?.imagePath ?? "-",
                                          'phone':state.data?.data?.user?.phone ?? "",
                                          'isTampil': true
                                        });
                                    if (res == true) {
                                      if (!mounted) return;
                                      context
                                          .read<ConsultationCubit>()
                                          .getConsultant(id: widget.id);
                                    }
                                  },
                                  child: Text(
                                    'Jawab Konsultasi',
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
              ],
            ),
    );
  }
}
