import 'package:dropdown_button2/dropdown_button2.dart';
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
import 'package:skala_mobile/main_routes/Pages/KonsultasiPraktisiPage/widgets/MainConsultationCardPraktisiWidget.dart';
import 'package:skala_mobile/main_widgets/main_category_card_widget.dart';
import 'package:skala_mobile/main_widgets/main_custom_appbar_title_widget.dart';
import 'package:skala_mobile/main_widgets/main_custom_card_widget.dart';
import 'package:skala_mobile/main_widgets/main_custom_confirm_dialog.dart';
import 'package:skala_mobile/main_widgets/main_custom_consultation_card_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skala_mobile/main_helpers/main_extensions_helper.dart';

class MainKonsultasiPraktisiPage extends StatefulWidget {
  const MainKonsultasiPraktisiPage(
      {Key? key, this.id, this.status, this.categoryId})
      : super(key: key);
  final int? id;
  final int? status;
  final int? categoryId;

  @override
  State<MainKonsultasiPraktisiPage> createState() =>
      _MainKonsultasiPraktisiPageState();
}

class _MainKonsultasiPraktisiPageState
    extends State<MainKonsultasiPraktisiPage> {
  final _prefs = Prefs();

  void _fetch() {
    context.read<ConsultationCubit>().getCategories();
    context.read<ConsultationCubit>().getConsultationList(
        statusId: widget.status, categoryId: widget.categoryId);
    context
        .read<ConsultationCubit>()
        .getConsultationListUser(statusId: widget.status);
    context.read<ConsultationCubit>().getConsultationCount();
  }

  void initState() {
    _fetch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColorData.greybg,
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
          ? SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    margin:
                        EdgeInsets.symmetric(horizontal: MainSizeData.SIZE_10),
                    padding: EdgeInsets.symmetric(
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
                            Text(
                              'Pilih Tenaga Ahli Berdasarkan Kategori?',
                              style: const TextStyle(
                                  color: MainColorData.green_dop,
                                  fontSize: MainSizeData.SIZE_14,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
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
                                        : Container(
                                            height: MainSizeData.SIZE_50,
                                            child: ListView.builder(
                                              itemCount:
                                                  state.data?.data?.length,
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
                        SizedBox(
                          height: MainSizeData.SIZE_10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Daftar Tenaga Ahli',
                              style: const TextStyle(
                                  color: MainColorData.green_dop,
                                  fontSize: MainSizeData.SIZE_14,
                                  fontWeight: FontWeight.w600),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Get.toNamed(MainConstantRoute.mainListPraktisi);
                              },
                              child: Text(
                                'Lihat',
                                style: TextStyle(
                                    fontSize: MainSizeData.SIZE_14,
                                    fontWeight: FontWeight.w600,
                                    color: MainColorData.white),
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: MainColorData.green_dop,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: MainSizeData.SIZE_18,
                                      vertical: MainSizeData.SIZE_8),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          MainSizeData.SIZE_12))),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: MainSizeData.SIZE_10,
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 0,
                    ),
                    decoration: BoxDecoration(
                      color: MainColorData.white,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: MainSizeData.SIZE_24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Riwayat Konsultasi',
                                style: TextStyle(
                                    color: MainColorData.green_dop,
                                    fontSize: MainSizeData.SIZE_14,
                                    fontWeight: FontWeight.w600),
                              ),
                              DropdownButtonHideUnderline(
                                child: DropdownButton2(
                                  customButton: Image.asset(
                                    "assets/icons/ic_filter.png",
                                    width: MainSizeData.SIZE_28,
                                  ),
                                  items: [
                                    ...MenuItems.firstItems.map(
                                      (item) => DropdownMenuItem<MenuItem>(
                                        value: item,
                                        child: MenuItems.buildItem(item),
                                      ),
                                    ),
                                  ],
                                  onChanged: (value) {
                                    MenuItems.onChanged(
                                        context, value as MenuItem);
                                  },
                                  itemHeight: MainSizeData.SIZE_36,
                                  itemPadding: const EdgeInsets.only(
                                      left: 16, right: 16),
                                  dropdownWidth: 130,
                                  dropdownPadding:
                                      const EdgeInsets.symmetric(vertical: 6),
                                  dropdownDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: MainColorData.white,
                                  ),
                                  dropdownElevation: 8,
                                  offset: const Offset(40, -4),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: MainSizeData.SIZE_10,
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
                                    ? Container(
                                        alignment: Alignment.center,
                                        height: MainSizeData.imageHeight300,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/404.png'),
                                                fit: BoxFit.fitHeight)),
                                      )
                                    : Container(
                                        height: MainSizeData.SIZE_460,
                                        child: ListView.builder(
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
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: MainSizeData.SIZE_12),
                    child: BlocBuilder<ConsultationCubit, ConsultationState>(
                      buildWhen: (previous, current) =>
                          current is ConsultationCountFetch,
                      builder: (context, state) {
                        if (state is ConsultationCountFetch) {
                          return loadData(
                            state.load,
                            errorMessage: state.message,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: MainSizeData.SIZE_120,
                                    child: MainCustomCard(
                                        itemCount: state
                                            .data?.data?.answeredConsultations
                                            .toString(),
                                        itemTitle: "Terjawab",
                                        onTap: () async {
                                          final res = await Get.to(() =>
                                              BlocProvider.value(
                                                value: context
                                                    .read<ConsultationCubit>(),
                                                child:
                                                    MainKonsultasiPraktisiPage(
                                                        status: 2),
                                              ));
                                          if (res == true) {
                                            _fetch();
                                          }
                                        }),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: MainSizeData.SIZE_120,
                                    child: MainCustomCard(
                                        itemCount: state
                                            .data?.data?.unansweredConsultations
                                            .toString(),
                                        itemTitle: "Menunggu",
                                        onTap: () async {
                                          final res = await Get.to(() =>
                                              BlocProvider.value(
                                                value: context
                                                    .read<ConsultationCubit>(),
                                                child:
                                                    MainKonsultasiPraktisiPage(
                                                        status: 1),
                                              ));
                                          if (res == true) {
                                            _fetch();
                                          }
                                        }),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                        return const SizedBox();
                      },
                    )),
                const SizedBox(
                  height: MainSizeData.SIZE_14,
                ),
                const Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: MainSizeData.SIZE_18),
                  child: const Text(
                    'Daftar Konsultasi',
                    style: TextStyle(
                        color: MainColorData.green_dop,
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
                            ? Container(
                                alignment: Alignment.center,
                                height: MainSizeData.imageHeight300,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                            AssetImage('assets/images/404.png'),
                                        fit: BoxFit.fitHeight)),
                              )
                            : Expanded(
                                child: Container(
                                  height: MainSizeData.SIZE_470,
                                  child: ListView.builder(
                                    itemCount: state.data?.data?.length,
                                    itemBuilder: (context, index) {
                                      return _buildConsultationListUser(
                                          context, state.data?.data?[index]);
                                    },
                                  ),
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
    return MainConsultationCardPraktisi(
      fromUser: item?.user,
      date: item?.date?.ddMMMMyyyy(),
      time: item?.time,
      kategori: item?.category,
      title: item?.title,
      status: item?.status.toString(),
      profession: item?.profession,
      onPressed: () async {
        final res = await Get.toNamed(
            MainConstantRoute.mainKonsultasiPraktisiDetail,
            arguments: {
              'id': item?.id,
            });
        if (res == true) {
          if (!mounted) return;
          context
              .read<ConsultationCubit>()
              .getDetailConsultationPraktisi(id: widget.id);
        }
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

  Widget _buildConsultationCategories(
      BuildContext context, ConsultationCategoriesModelData? categories) {
    return MainCategoryCard(
      label: categories?.name,
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

class MenuItem {
  final String text;
  const MenuItem({
    required this.text,
  });
}

class MenuItems {
  static const List<MenuItem> firstItems = [dibalas, menunggu];

  static const dibalas = MenuItem(text: 'Dibalas');
  static const menunggu = MenuItem(text: 'Menunggu');

  static Widget buildItem(MenuItem item) {
    return Text(
      item.text,
      style: const TextStyle(color: MainColorData.green_dop),
    );
  }

  static onChanged(BuildContext context, MenuItem item) async {
    switch (item) {
      case MenuItems.dibalas:
        //Do something
        final res = await Get.to(() => BlocProvider.value(
              value: context.read<ConsultationCubit>(),
              child: MainKonsultasiPraktisiPage(status: 2),
            ));
        break;
      case MenuItems.menunggu:
        //Do something
        final res = await Get.to(() => BlocProvider.value(
              value: context.read<ConsultationCubit>(),
              child: MainKonsultasiPraktisiPage(status: 1),
            ));
        break;
    }
  }
}
