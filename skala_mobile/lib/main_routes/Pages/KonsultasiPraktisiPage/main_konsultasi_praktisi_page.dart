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
import 'package:skala_mobile/main_widgets/main_custom_appbar_title_widget.dart';
import 'package:skala_mobile/main_widgets/main_custom_card_widget.dart';
import 'package:skala_mobile/main_widgets/main_custom_consultation_card_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainKonsultasiPraktisiPage extends StatefulWidget {
  const MainKonsultasiPraktisiPage({Key? key}) : super(key: key);

  @override
  State<MainKonsultasiPraktisiPage> createState() =>
      _MainKonsultasiPraktisiPageState();
}

class _MainKonsultasiPraktisiPageState
    extends State<MainKonsultasiPraktisiPage> {
  void _fetch() {
    context.read<ConsultationCubit>().getCategories();
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: MainSizeData.SIZE_18, vertical: MainSizeData.SIZE_8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Kategori',
                style: const TextStyle(
                    color: MainColorData.grey,
                    fontSize: MainSizeData.SIZE_14,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: MainSizeData.SIZE_8,
              ),
              BlocBuilder<ConsultationCubit, ConsultationState>(
                  buildWhen: (previous, current) => current is CategoriesFetch,
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
                  }),
              GestureDetector(
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
              // SizedBox(
              //   height: MainSizeData.SIZE_120,
              //   child: Row(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Expanded(
              //         child: MainCustomCard(
              //           itemCount: "9",
              //           itemTitle: "Kesehatan Mental",
              //           onTap: () {
              //             Get.toNamed(MainConstantRoute.mainListPraktisi);
              //           },
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              SizedBox(
                height: MainSizeData.SIZE_14,
              ),
              Text(
                'Daftar Konsultasi',
                style: const TextStyle(
                    color: MainColorData.grey,
                    fontSize: MainSizeData.SIZE_14,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: MainSizeData.SIZE_8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildConsultationCategories(
    BuildContext context, ConsultationCategoriesModelData? categories) {
  return MainCustomCard(itemTitle: categories?.name, onTap: () {});
}
