import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:skala_mobile/main_bloc/consultations/consultation_cubit.dart';
import 'package:skala_mobile/main_bloc/consultations/consultation_state.dart';
import 'package:skala_mobile/main_commons/main_color_data.dart';
import 'package:skala_mobile/main_commons/main_size_data.dart';
import 'package:skala_mobile/main_helpers/main_bloc_helper.dart';
import 'package:skala_mobile/main_models/main_consultant_list_model.dart';
import 'package:skala_mobile/main_models/main_consultation_categories_model.dart';
import 'package:skala_mobile/main_routes/Pages/KonsultasiPraktisiPage/main_konsultasi_praktisi_bio.dart';
import 'package:skala_mobile/main_widgets/main_category_card_widget.dart';
import 'package:skala_mobile/main_widgets/main_custom_appbar_title_widget.dart';
import 'package:skala_mobile/main_widgets/main_custom_card_praktisi.dart';

class MainKonsultasiListPraktisi extends StatefulWidget {
  const MainKonsultasiListPraktisi({
    Key? key,
    this.categoryId,
  }) : super(key: key);
  final int? categoryId;
  @override
  State<MainKonsultasiListPraktisi> createState() =>
      _MainKonsultasiListPraktisiState();
}

class _MainKonsultasiListPraktisiState
    extends State<MainKonsultasiListPraktisi> {
  void _fetch() {
    context.read<ConsultationCubit>().getCategories();
    context.read<ConsultationCubit>().getConsultantList(id: widget.categoryId);
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
        title: "Konsultasi",
        titleStyle: TextStyle(
            color: MainColorData.black,
            fontSize: MainSizeData.SIZE_16,
            fontWeight: FontWeight.bold),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              margin:
                  const EdgeInsets.symmetric(horizontal: MainSizeData.SIZE_10),
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                color: MainColorData.white,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Pilih Tenaga Ahli Berdasarkan Kategori?',
                        style: TextStyle(
                            color: MainColorData.green_dop,
                            fontSize: MainSizeData.SIZE_16,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: MainSizeData.SIZE_10,
                      ),
                      BlocBuilder<ConsultationCubit, ConsultationState>(
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
                                  : SizedBox(
                                      height: MainSizeData.SIZE_50,
                                      child: ListView.builder(
                                        itemCount: state.data?.data?.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: ((context, index) {
                                          return _buildConsultationCategories(
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
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: MainSizeData.SIZE_20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MainSizeData.SIZE_30,
              ),
              child: Text(
                'Daftar Tenaga Ahli',
                style: TextStyle(
                    color: MainColorData.green_dop,
                    fontSize: MainSizeData.SIZE_16,
                    fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              height: MainSizeData.SIZE_10,
            ),
            BlocBuilder<ConsultationCubit, ConsultationState>(
              buildWhen: ((previous, current) =>
                  current is ConsultantListFetch),
              builder: (context, state) {
                if (state is ConsultantListFetch) {
                  return loadData(state.load,
                      errorMessage: state.message,
                      child: (state.data?.data?.isEmpty ?? true)
                          ? const Center(
                              child: Text('Kosong'),
                            )
                          : SizedBox(
                              height: MainSizeData.SIZE_900,
                              child: ListView.builder(
                                itemCount: state.data?.data?.length,
                                itemBuilder: (context, index) {
                                  return _buildConsultantList(
                                      context, state.data?.data?[index]);
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

  Widget _buildConsultationCategories(
      BuildContext context, ConsultationCategoriesModelData? categories) {
    return MainCategoryCard(
      label: categories?.name,
      onTap: () async {
        context.read<ConsultationCubit>().getConsultantList(id: categories?.id);
      },
    );
  }

  Widget _buildConsultantList(
      BuildContext context, ConsultantListModelData? consultantList) {
    return MainCustomCardPraktisi(
      itemName: consultantList?.name,
      itemCategory: consultantList?.consultantCategory,
      onPressed: () async {
        print(consultantList?.id);
        final res = await Get.to(
          () => BlocProvider.value(
            value: context.read<ConsultationCubit>(),
            child: MainKonsultasiPraktisiBio(id: consultantList?.id),
          ),
        );
        print(res);
        if (res == true) {
          _fetch();
        }
      },
    );
  }
}
