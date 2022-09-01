import 'package:dropdown_button2/dropdown_button2.dart';
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
import 'package:skala_mobile/main_models/main_consultation_model.dart';
import 'package:skala_mobile/main_widgets/main_category_card_widget.dart';
import 'package:skala_mobile/main_widgets/main_custom_appbar_title_widget.dart';
import 'package:skala_mobile/main_widgets/main_custom_confirm_dialog.dart';
import 'package:skala_mobile/main_widgets/main_custom_consultation_card_widget.dart';
import 'package:skala_mobile/main_helpers/main_extensions_helper.dart';

class MainRiwayatKonsultasiPage extends StatefulWidget {
  const MainRiwayatKonsultasiPage(
      {Key? key, this.id, this.status, this.categoryId})
      : super(key: key);
  final int? id;
  final int? status;
  final int? categoryId;
  @override
  State<MainRiwayatKonsultasiPage> createState() =>
      _MainRiwayatKonsultasiPageState();
}

class _MainRiwayatKonsultasiPageState extends State<MainRiwayatKonsultasiPage> {
  void _fetch() {
    context.read<ConsultationCubit>().getConsultationList(
        statusId: widget.status, categoryId: widget.categoryId);
  }

  void initState() {
    _fetch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const MainCustomAppBarTitle(
        title: "Riwayat Konsultasi",
        titleStyle: TextStyle(
            color: MainColorData.black,
            fontSize: MainSizeData.SIZE_16,
            fontWeight: FontWeight.bold),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: MainSizeData.SIZE_16),
              child: Row(
                children: [
                  MainCategoryCard(
                      label: "DIBALAS",
                      onTap: () async {
                        context
                            .read<ConsultationCubit>()
                            .getConsultationList(statusId: 2);
                      }),
                  SizedBox(
                    width: MainSizeData.SIZE_10,
                  ),
                  MainCategoryCard(
                      label: "MENUNGGU",
                      onTap: () {
                        context
                            .read<ConsultationCubit>()
                            .getConsultationList(statusId: 1);
                      }),
                ],
              ),
            ),
            const SizedBox(
              height: MainSizeData.SIZE_10,
            ),
            BlocConsumer<ConsultationCubit, ConsultationState>(
              listenWhen: (previous, current) => current is ConsultationDelete,
              listener: (context, state) {
                if (state is ConsultationDelete) {
                  blocHelperListenner(
                    load: state.load,
                    onSuccess: () {
                      _fetch();
                    },
                  );
                }
              },
              buildWhen: (previous, current) => current is ConsultationFetch,
              builder: (context, state) {
                if (state is ConsultationFetch) {
                  return loadData(
                    state.load,
                    errorMessage: state.message,
                    child: (state.data?.data?.isEmpty ?? true)
                        ? Container(
                            alignment: Alignment.center,
                            height: MainSizeData.imageHeight300,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/images/404.png'),
                                    fit: BoxFit.fitHeight)),
                          )
                        : Container(
                            height: size.height * 0.8,
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: state.data?.data?.length,
                              itemBuilder: ((context, index) {
                                return _buildConsultationItem(
                                  context,
                                  state.data?.data?[index],
                                );
                              }),
                            ),
                          ),
                  );
                }
                return const SizedBox();
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _buildConsultationItem(
      BuildContext context, ConsultationModelData? consultation) {
    return MainConsultationCard(
        toUser: consultation?.toUser,
        title: consultation?.title,
        date: consultation?.date?.ddMMMMyyyy(),
        time: consultation?.time?.toString(),
        status: consultation?.status.toString(),
        label: consultation?.category.toString(),
        onDelete: () async {
          final res = await showDialog(
            context: context,
            builder: (ctx) =>
                ConfirmDialogWidget(title: 'Hapus Konsultation ?'),
          );
          if (res == true) {
            context
                .read<ConsultationCubit>()
                .delete(consultation?.id.toString() ?? '');
          }
        },
        onPressed: () async {
          final res = await Get.toNamed(
              MainConstantRoute.mainKonsultasiPraktisiDetail,
              arguments: {
                'id': consultation?.id,
              });
          if (res == true) {
            if (!mounted) return;
            context
                .read<ConsultationCubit>()
                .getDetailConsultationPraktisi(id: widget.id);
          }
        });
  }
}
