import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:skala_mobile/main_commons/main_color_data.dart';
import 'package:skala_mobile/main_commons/main_size_data.dart';
import 'package:skala_mobile/main_models/main_kegiatan_detail_model.dart';
import 'package:skala_mobile/main_widgets/main_custom_appbar_title_widget.dart';

class KegiatanLainDetailPage extends StatelessWidget {
  final KegiatanLainArticle? kegiatanLainArticle;
  const KegiatanLainDetailPage({Key? key, this.kegiatanLainArticle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColorData.white,
      appBar: MainCustomAppBarTitle(
        appBar: AppBar(),
        title: 'Kegiatan Lain',
        titleStyle: const TextStyle(
          color: MainColorData.black,
          fontSize: MainSizeData.SIZE_16,
          fontWeight: FontWeight.w700,
        ),
        onPressed: null,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: MainSizeData.SIZE_180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(MainSizeData.SIZE_20),
                  image: DecorationImage(
                      image: NetworkImage(
                        kegiatanLainArticle?.urlToImage ?? "",
                      ),
                      fit: BoxFit.cover),
                ),
              ),
              Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          kegiatanLainArticle?.title ?? "",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        Divider(
                          color: Colors.grey,
                        ),
                        Text(
                          'Date: ${kegiatanLainArticle?.publishedAt ?? ""}',
                        ),
                        SizedBox(height: 10),
                        Text('Author: ${kegiatanLainArticle?.author ?? ""}'),
                        Divider(color: Colors.grey),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              kegiatanLainArticle?.content ?? "",
                              style: TextStyle(
                                  color: MainColorData.black,
                                  fontSize: 16,
                                  height: 1.5),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        // MainCustomRoundedButton(
                        //   margin: EdgeInsets.zero,
                        //   text: 'Read More',
                        //   onPressed: () {},
                        // ),
                      ]))
            ],
          ),
        ),
      ),
    );
  }
}