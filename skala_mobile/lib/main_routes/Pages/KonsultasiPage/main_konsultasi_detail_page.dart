import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:skala_mobile/main_bloc/konsultasi/konsultasi_cubit.dart';
import 'package:skala_mobile/main_bloc/konsultasi/kosultasi_state.dart';
import 'package:skala_mobile/main_commons/main_color_data.dart';
import 'package:skala_mobile/main_commons/main_size_data.dart';
import 'package:skala_mobile/main_helpers/main_bloc_helper.dart';
import 'package:skala_mobile/main_models/main_konsultasi_dummy_model.dart';
import 'package:skala_mobile/main_models/main_konsultasi_model.dart';
import 'package:skala_mobile/main_widgets/main_custom_appbar_title_widget.dart';
import 'package:skala_mobile/main_widgets/main_custom_consultation_card_widget.dart';
import 'package:skala_mobile/main_helpers/main_extensions_helper.dart';

class MainKonsultasiDetailPage extends StatefulWidget {
  final KonsultasiModelData? konsultasi;
  const MainKonsultasiDetailPage(
    this.id, {
    Key? key,
    this.konsultasi,
  }) : super(key: key);

  final int? id;

  @override
  State<MainKonsultasiDetailPage> createState() =>
      _MainKonsultasiDetailPageState();
}

class _MainKonsultasiDetailPageState extends State<MainKonsultasiDetailPage> {
  double rating = 0;
  @override
  void initState() {
    context.read<KonsultasiCubit>().getDetail(widget.id.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColorData.white,
      appBar: MainCustomAppBarTitle(
        appBar: AppBar(),
        title: "Konsultasi",
        titleStyle: const TextStyle(
            color: MainColorData.black,
            fontSize: MainSizeData.SIZE_16,
            fontWeight: FontWeight.bold),
      ),
      body: BlocBuilder<KonsultasiCubit, KonsultasiState>(
        buildWhen: (previous, current) => current is KonsultasiDetailFetch,
        builder: (context, state) {
          if (state is KonsultasiDetailFetch) {
            return loadData(
              state.load,
              errorMessage: state.message,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      children: state.data?.data
                              ?.map(
                                (e) => MainConsultationCard(
                                  date: e.date?.ddMMMMyyyy() ?? "",
                                  title: e.title?.toString() ?? "",
                                  description: e.description,
                                  time: e.time,
                                  onPressed: () {},
                                ),
                              )
                              .toList() ??
                          [],
                    ),
                    SizedBox(
                      height: MainSizeData.SIZE_16,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text('Berikan penilaian konsultasi ? ',
                          style: TextStyle(
                              color: MainColorData.black, fontSize: 14)),
                      SizedBox(
                        height: MainSizeData.SIZE_14,
                      ),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text(
                                "Masukkan Penilaian Konsultasi",
                                style: TextStyle(
                                    color: MainColorData.green_dop,
                                    fontSize: 14),
                              ),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [buildRating()],
                              ),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      context 
                                        .read<KonsultasiCubit>()
                                        .ratingKonsultasi(
                                          consultationId: widget.id,
                                          rating: rating.toInt(),
                                        );
                                    },
                                    child: GestureDetector(
                                      onTap: (){
                                        Get.back();
                                      },
                                      child: Text(
                                        'OK',
                                        style: TextStyle(
                                            fontSize: MainSizeData.SIZE_14,
                                            color: MainColorData.green_dop),
                                      ),
                                    ))
                              ],
                            ),
                          );
                        },
                        child: Text(
                          'Rating',
                          style: TextStyle(
                              color: MainColorData.green_dop,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ]),
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

  Widget buildRating() => RatingBar.builder(
        minRating: 1,
        itemSize: MainSizeData.SIZE_25,
        itemPadding: EdgeInsets.symmetric(),
        itemBuilder: (context, _) =>
            Icon(Icons.star, color: MainColorData.yellowFF),
        updateOnDrag: true,
        onRatingUpdate: (rating) => setState(
          () {
            this.rating = rating;
          },
        ),
      );
}
