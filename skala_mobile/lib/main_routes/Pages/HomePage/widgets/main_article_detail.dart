import 'package:flutter/material.dart';
import 'package:skala_mobile/main_commons/main_color_data.dart';
import 'package:skala_mobile/main_commons/main_size_data.dart';
import 'package:skala_mobile/main_helpers/main_article.dart';
import 'package:skala_mobile/main_widgets/main_custom_appbar_title_widget.dart';
import 'package:skala_mobile/main_widgets/main_custom_rounded_button.dart';

class ArticleDetailPage extends StatelessWidget {
  final Article? article;
  const ArticleDetailPage({this.article, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MainColorData.white,
        appBar: MainCustomAppBarTitle(
          appBar: AppBar(),
          title: "Berita",
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
                          article?.urlToImage??"",
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
                            article?.title??"",
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
                            'Date: ${article?.publishedAt??""}',
                          ),
                          SizedBox(height: 10),
                          Text('Author: ${article?.author??""}'),
                          Divider(color: Colors.grey),
                          Text(
                            article?.content??"",
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 10),
                          MainCustomRoundedButton(
                            margin: EdgeInsets.zero,
                            text: 'Read More',
                            onPressed: () {},
                          ),
                        ]))
              ],
            ),
          ),
        ));
  }
}
