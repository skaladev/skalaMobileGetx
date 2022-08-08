import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skala_mobile/main_bloc/consultations/consultation_cubit.dart';
import 'package:skala_mobile/main_bloc/consultations/consultation_state.dart';
import 'package:skala_mobile/main_commons/main_color_data.dart';
import 'package:skala_mobile/main_commons/main_constant_route.dart';
import 'package:skala_mobile/main_commons/main_size_data.dart';
import 'package:skala_mobile/main_helpers/main_bloc_helper.dart';
import 'package:skala_mobile/main_models/main_consultant_list_model.dart';
import 'package:skala_mobile/main_routes/Pages/KonsultasiPraktisiPage/main_konsultasi_praktisi_bio.dart';
import 'package:skala_mobile/main_widgets/main_custom_appbar_title_widget.dart';
import 'package:skala_mobile/main_widgets/main_custom_card_praktisi.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainKonsultasiListPraktisi extends StatefulWidget {
  const MainKonsultasiListPraktisi({Key? key}) : super(key: key);

  @override
  State<MainKonsultasiListPraktisi> createState() =>
      _MainKonsultasiListPraktisiState();
}

class _MainKonsultasiListPraktisiState
    extends State<MainKonsultasiListPraktisi> {
  void _fetch() {
    context.read<ConsultationCubit>().getConsultantList();
  }

  void initState() {
    _fetch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainCustomAppBarTitle(
        title: "Konsultasi",
        titleStyle: TextStyle(
            color: MainColorData.black,
            fontSize: MainSizeData.SIZE_16,
            fontWeight: FontWeight.bold),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<ConsultationCubit, ConsultationState>(
              buildWhen: ((previous, current) => current is ConsultantFetch),
              builder: (context, state) {
                if (state is ConsultantFetch) {
                  return loadData(state.load,
                      errorMessage: state.message,
                      child: (state.data?.data?.isEmpty ?? true)
                          ? const Center(
                              child: Text('Kosong'),
                            )
                          : Container(
                            height: MainSizeData.SIZE_900,
                            child: ListView.builder(
                                itemCount: state.data?.data?.length,
                                itemBuilder: (context, index) {
                                  return _buildConsultantList(
                                      context,
                                      state.data?.data?[index]);
                                },
                              ),
                          ));
                }
                return const SizedBox();
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _buildConsultantList(
      BuildContext context, ConsultantListModelData? consultantList) {
    return MainCustomCardPraktisi(
      itemName: consultantList?.name,
      itemCategory: consultantList?.consultantCategory,
      onPressed: () async {
        final res = await Get.to(() => BlocProvider.value(
              value: context.read<ConsultationCubit>(),
              child: MainKonsultasiPraktisiBio(consultantList?.id),
            ));
        if (res == true) {
          _fetch();
        }
      },
    );
  }
}
