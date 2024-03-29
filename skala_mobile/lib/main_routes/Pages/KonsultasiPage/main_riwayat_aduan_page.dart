import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:skala_mobile/main_bloc/konsultasi/konsultasi_cubit.dart';
import 'package:skala_mobile/main_bloc/konsultasi/kosultasi_state.dart';
import 'package:skala_mobile/main_commons/main_color_data.dart';
import 'package:skala_mobile/main_commons/main_size_data.dart';
import 'package:skala_mobile/main_helpers/main_bloc_helper.dart';
import 'package:skala_mobile/main_models/main_konsultasi_model.dart';
import 'package:skala_mobile/main_routes/Pages/KonsultasiPage/main_konsultasi_detail_page.dart';
import 'package:skala_mobile/main_widgets/main_custom_appbar_title_widget.dart';
import 'package:skala_mobile/main_widgets/main_custom_confirm_dialog.dart';
import 'package:skala_mobile/main_widgets/main_custom_consultation_card_widget.dart';
import 'package:skala_mobile/main_helpers/main_extensions_helper.dart';

class RiwayatAduanPage extends StatefulWidget {
  const RiwayatAduanPage({super.key});

  @override
  State<RiwayatAduanPage> createState() => _RiwayatAduanPageState();
}

class _RiwayatAduanPageState extends State<RiwayatAduanPage> {
  void _fetch() {
    context.read<KonsultasiCubit>().getList();
  }

  @override
  void initState() {
    _fetch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainCustomAppBarTitle(
        title: "Riwayat Aduan",
        titleStyle: TextStyle(
            color: MainColorData.black,
            fontSize: MainSizeData.SIZE_16,
            fontWeight: FontWeight.bold),
      ),
      body: BlocConsumer<KonsultasiCubit, KonsultasiState>(
        listenWhen: (previous, current) => current is KonsultasiDelete,
        listener: (context, state) {
          if (state is KonsultasiDelete) {
            blocHelperListenner(
                load: state.load,
                onSuccess: () {
                  _fetch();
                });
          }
        },
        buildWhen: (previous, current) => current is KonsultasiFetch,
        builder: (context, state) {
          if (state is KonsultasiFetch) {
            return loadData(
              state.load,
              errorMessage: state.message,
              child: (state.data?.data?.isEmpty ?? true)
                  ? Center(
                      child: Container(
                        alignment: Alignment.center,
                        height: MainSizeData.imageHeight300,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/404.png'),
                                fit: BoxFit.fitHeight)),
                      ),
                    )
                  : ListView.builder(
                      itemCount: state.data?.data?.length,
                      itemBuilder: (context, index) {
                        return _buildKonsultasiItem(
                          context,
                          state.data?.data?[index],
                        );
                      },
                    ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget _buildKonsultasiItem(
      BuildContext context, KonsultasiModelData? konsultasiDummy) {
    return MainConsultationCard(
      title: konsultasiDummy?.title,
      date: konsultasiDummy?.date?.ddMMMMyyyy(),
      time: konsultasiDummy?.time?.toString(),
      status: konsultasiDummy?.status.toString(),
      label: konsultasiDummy?.label.toString(),
      onDelete: () async {
        final res = await showDialog(
          context: context,
          builder: (ctx) => ConfirmDialogWidget(title: 'Hapus Aduan ?'),
        );
        if (res == true) {
          context
              .read<KonsultasiCubit>()
              .delete(konsultasiDummy?.id.toString() ?? '');
        }
      },
      onPressed: () async {
        final res = await Get.to(() => BlocProvider.value(
              value: context.read<KonsultasiCubit>(),
              child: MainKonsultasiDetailPage(
                konsultasiDummy?.id,
              ),
            ));
        if (res == true) {
          _fetch();
        }
      },
    );
  }
}
