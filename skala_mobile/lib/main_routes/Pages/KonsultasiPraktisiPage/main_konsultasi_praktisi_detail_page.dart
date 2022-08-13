import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skala_mobile/main_bloc/consultations/consultation_cubit.dart';
import 'package:skala_mobile/main_bloc/consultations/consultation_state.dart';
import 'package:skala_mobile/main_commons/main_color_data.dart';
import 'package:skala_mobile/main_commons/main_size_data.dart';
import 'package:skala_mobile/main_helpers/main_bloc_helper.dart';
import 'package:skala_mobile/main_models/main_consultation_detail.dart';
import 'package:skala_mobile/main_models/main_consultation_model.dart';
import 'package:skala_mobile/main_widgets/main_custom_appbar_title_widget.dart';
import 'package:skala_mobile/main_widgets/main_custom_consultation_card_widget.dart';
import 'package:skala_mobile/main_widgets/main_header_konsultasi_praktisi_widget.dart';
import 'package:skala_mobile/main_helpers/main_extensions_helper.dart';

class MainKonsultasiPraktisiDetailPage extends StatefulWidget {
  final ConsultationModelData? consultation;
  const MainKonsultasiPraktisiDetailPage(
    this.id, 
    {Key? key, this.consultation})
      : super(key: key);
  final int? id;
  @override
  State<MainKonsultasiPraktisiDetailPage> createState() =>
      _MainKonsultasiPraktisiDetailPageState();
}

class _MainKonsultasiPraktisiDetailPageState
    extends State<MainKonsultasiPraktisiDetailPage> {

  @override
  void initState(){
    context.read<ConsultationCubit>().getDetailConsultation(widget.id.toString());
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
          buildWhen: (previous, current) => current is ConsultationDetailFetch,
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
                          itemName: "Aksal Syah Falah P.si",
                          itemKategori: "kesehatan mental",
                          itemWorkExperience: 5,
                          itemSK: "466.1/0445/01.DPMPTSP/OL/2021",
                          itemImage: "assets/images/user.png",
                          size: size),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: MainSizeData.SIZE_16),
                        child: Text(
                          "Petanyaan",
                          style: TextStyle(
                            fontSize: MainSizeData.SIZE_16,
                            fontWeight: FontWeight.bold,
                            color: MainColorData.grey75,
                          ),
                        ),
                      ),
                      Column(
                        children: state.data?.data
                                ?.map(
                                  (e) => MainConsultationCard(
                                    date: e.date?.ddMMMMyyyy()??"",
                                    title: e.title?.toString(),
                                    description: e.description,
                                    time: e.time,
                                    onPressed: () {},
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
        ));
  }
}
