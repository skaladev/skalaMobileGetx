import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/route_manager.dart';
import 'package:skala_mobile/main_commons/main_color_data.dart';
import 'package:skala_mobile/main_commons/main_size_data.dart';
import 'package:skala_mobile/main_helpers/main_article.dart';
import 'package:skala_mobile/main_routes/Pages/HomePage/widgets/main_article_detail.dart';

class MainKegiatanLainPage extends StatelessWidget {
  const MainKegiatanLainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          stretch: true,
          expandedHeight: MainSizeData.SIZE_300,
          backgroundColor: Color.fromARGB(255, 2, 210, 225),
          flexibleSpace: FlexibleSpaceBar(
            background: Image.asset(
              "assets/images/img_reading.jpg",
              width: double.maxFinite,
              fit: BoxFit.cover,
            ),
            title: Text(
              "Kegiatan Lain",
              style: const TextStyle(
                  color: MainColorData.white,
                  fontSize: MainSizeData.fontSize16,
                  fontWeight: FontWeight.bold),
            ),
            stretchModes: <StretchMode>[
              StretchMode.zoomBackground,
              StretchMode.blurBackground,
              StretchMode.fadeTitle,
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(200),
              bottomRight: Radius.circular(3000)

            )
          )
        ),
        SliverToBoxAdapter(
            child: Container(
          height: MainSizeData.SIZE_650,
          decoration: BoxDecoration(color: MainColorData.white),
          child: FutureBuilder<String>(
            future: DefaultAssetBundle.of(context)
                .loadString('assets/articles.json'),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                final List<Article> articles = parseArticles(snapshot.data);
                return SizedBox(
                  height: MainSizeData.SIZE_450,
                  child: ListView.builder(
                    itemCount: articles.length,
                    itemBuilder: (context, index) {
                      return _buildArticleItem(context, articles[index]);
                    },
                  ),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ))
      ],
    ));
  }
}

Widget _buildArticleItem(BuildContext context, Article article) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 0),
    child: GestureDetector(
      onTap: () {
        Get.to(ArticleDetailPage(
          article: article,
        ));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    height: MainSizeData.SIZE_60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                            article.urlToImage,
                          ),
                        )),
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Title(
                                  color: MainColorData.black,
                                  child: Text(
                                    (article.title),
                                  )),
                              SizedBox(height: MainSizeData.SIZE_4),
                              Text(article.author),
                            ])))
              ]),
        ),
      ),
    ),
  );
}
