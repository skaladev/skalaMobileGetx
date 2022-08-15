import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:skala_mobile/main_bloc/consultations/consultation_cubit.dart';
import 'package:skala_mobile/main_bloc/consultations/consultation_state.dart';
import 'package:skala_mobile/main_commons/main_color_data.dart';
import 'package:skala_mobile/main_commons/main_constant_route.dart';
import 'package:skala_mobile/main_commons/main_size_data.dart';
import 'package:skala_mobile/main_helpers/main_bloc_helper.dart';
import 'package:skala_mobile/main_models/main_consultation_categories_model.dart';
import 'package:skala_mobile/main_models/main_consultation_list_user.dart';
import 'package:skala_mobile/main_models/main_consultation_model.dart';
import 'package:skala_mobile/main_prefs/prefs.dart';
import 'package:skala_mobile/main_routes/Pages/KonsultasiPraktisiPage/main_konsultasi_list_praktisi_page.dart';
import 'package:skala_mobile/main_routes/Pages/KonsultasiPraktisiPage/main_konsultasi_praktisi_detail_page.dart';
import 'package:skala_mobile/main_widgets/main_custom_appbar_title_widget.dart';
import 'package:skala_mobile/main_widgets/main_custom_card_widget.dart';
import 'package:skala_mobile/main_widgets/main_custom_confirm_dialog.dart';
import 'package:skala_mobile/main_widgets/main_custom_consultation_card_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skala_mobile/main_helpers/main_extensions_helper.dart';

class MainKonsultasiPraktisiPage extends StatefulWidget {
  const MainKonsultasiPraktisiPage({Key? key}) : super(key: key);

  @override
  State<MainKonsultasiPraktisiPage> createState() =>
      _MainKonsultasiPraktisiPageState();
}

class _MainKonsultasiPraktisiPageState
    extends State<MainKonsultasiPraktisiPage> {
  final _prefs = Prefs();

  void _fetch() {
    context.read<ConsultationCubit>().getCategories();
    context.read<ConsultationCubit>().getConsultationList();
    context.read<ConsultationCubit>().getConsultationListUser();
  }

  void initState() {
    _fetch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColorData.white,
      appBar: const MainCustomAppBarTitle(
        title: "Konsultasi",
        isIconEnabled: false,
        titleStyle: TextStyle(
          color: MainColorData.black,
          fontSize: MainSizeData.fontSize16,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: _prefs.roleId != 6
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: MainSizeData.SIZE_18),
                  child: const Text(
                    'Kategori',
                    style: const TextStyle(
                        color: MainColorData.grey,
                        fontSize: MainSizeData.SIZE_14,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: MainSizeData.SIZE_8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: MainSizeData.SIZE_18),
                  child: BlocBuilder<ConsultationCubit, ConsultationState>(
                    buildWhen: (previous, current) =>
                        current is CategoriesFetch,
                    builder: (context, state) {
                      if (state is CategoriesFetch) {
                        return loadData(
                          state.load,
                          errorMessage: state.message,
                          child: (state.data?.data?.isEmpty ?? true)
                              ? const Center(
                                  child: Text('Kosong'),
                                )
                              : Container(
                                  height: MainSizeData.SIZE_90,
                                  child: ListView.builder(
                                    itemCount: state.data?.data?.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: ((context, index) {
                                      return _buildConsultationCategories(
                                        context,
                                        state.data?.data?[index],
                                        // itemTitle:  state.data?.data?.name ?? '-',
                                        // onTap: () {
                                        //   Get.toNamed(
                                        //       MainConstantRoute.mainListPraktisi);
                                        // },
                                      );
                                    }),
                                  ),
                                ),
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: MainSizeData.SIZE_18),
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(MainConstantRoute.mainListPraktisi);
                    },
                    child: Text(
                      "Lihat Tenaga Ahli",
                      style: TextStyle(
                          fontSize: MainSizeData.fontSize16,
                          fontWeight: FontWeight.bold,
                          color: MainColorData.orangeFC),
                    ),
                  ),
                ),
                const SizedBox(
                  height: MainSizeData.SIZE_14,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: MainSizeData.SIZE_18),
                  child: const Text(
                    'Riwayat Konsultasi',
                    style: TextStyle(
                        color: MainColorData.grey,
                        fontSize: MainSizeData.SIZE_14,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: MainSizeData.SIZE_8,
                ),
                BlocConsumer<ConsultationCubit, ConsultationState>(
                  listenWhen: (previous, current) =>
                      current is ConsultationDelete,
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
                  buildWhen: (previous, current) =>
                      current is ConsultationFetch,
                  builder: (context, state) {
                    if (state is ConsultationFetch) {
                      return loadData(
                        state.load,
                        errorMessage: state.message,
                        child: (state.data?.data?.isEmpty ?? true)
                            ? const Center(
                                child: Text('Kosong'),
                              )
                            : Container(
                                height: MainSizeData.SIZE_460,
                                child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  // shrinkWrap: true,
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
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: MainSizeData.SIZE_12),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: MainSizeData.SIZE_120,
                          child: MainCustomCard(
                              itemCount: "8",
                              itemTitle: "Terjawab",
                              onTap: () {}),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: MainSizeData.SIZE_120,
                          child: MainCustomCard(
                              itemCount: "8",
                              itemTitle: "Menunggu",
                              onTap: () {}),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: MainSizeData.SIZE_14,
                ),
                const Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: MainSizeData.SIZE_18),
                  child: const Text(
                    'Daftar Konsultasi',
                    style: TextStyle(
                        color: MainColorData.grey,
                        fontSize: MainSizeData.SIZE_14,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(height: MainSizeData.SIZE_8),
                BlocBuilder<ConsultationCubit, ConsultationState>(
                  buildWhen: (previous, current) =>
                      current is ConsultationUserFetch,
                  builder: (context, state) {
                    if (state is ConsultationUserFetch) {
                      return loadData(
                        state.load,
                        errorMessage: state.message,
                        child: (state.data?.data?.isEmpty ?? true)
                            ? const Center(
                                child: Text("Kosong"),
                              )
                            : Container(
                                height: MainSizeData.SIZE_470,
                                child: ListView.builder(
                                  itemCount: state.data?.data?.length,
                                  itemBuilder: (context, index) {
                                    return _buildConsultationListUser(
                                        context, state.data?.data?[index]);
                                  },
                                ),
                              ),
                      );
                    }
                    return const SizedBox();
                  },
                )
              ],
            ),
    );
  }

  Widget _buildConsultationListUser(
      BuildContext context, ConsultationListUserModelData? item) {
    return MainConsultationCard(
      title: item?.user,
      date: "",
      time: "",
      label: item?.profession ?? '-',
      onPressed: () {
        // final res = await Get.to(
        //   () => BlocProvider.value(
        //     value: context.read<ConsultationCubit>(),
        //     child: MainKonsultasiPraktisiDetailPage(item?.id),
        //   ),
        // );
      },
    );
  }

  Widget _buildConsultationItem(
      BuildContext context, ConsultationModelData? consultation) {
    return MainConsultationCard(
      title: consultation?.title,
      date: consultation?.date?.ddMMMMyyyy(),
      time: consultation?.time?.toString(),
      status: consultation?.status.toString(),
      label: consultation?.category.toString(),
      onDelete: () async {
        final res = await showDialog(
          context: context,
          builder: (ctx) => ConfirmDialogWidget(title: 'Hapus Konsultation ?'),
        );
        if (res == true) {
          context
              .read<ConsultationCubit>()
              .delete(consultation?.id.toString() ?? '');
        }
      },
      onPressed: () async {
        final res = await Get.to(
          () => BlocProvider.value(
            value: context.read<ConsultationCubit>(),
            child: MainKonsultasiPraktisiDetailPage(consultation?.id),
          ),
        );
      },
    );
  }

  Widget _buildConsultationCategories(
      BuildContext context, ConsultationCategoriesModelData? categories) {
    return MainCustomCard(
      itemTitle: categories?.name,
      onTap: () async {
        final res = await Get.to(() => BlocProvider.value(
              value: context.read<ConsultationCubit>(),
              child: MainKonsultasiListPraktisi(
                categoryId: categories?.id,
              ),
            ));
        if (res == true) {
          _fetch();
        }
      },
    );
  }
}
