import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/route_manager.dart';
import 'package:skala_mobile/main_commons/main_color_data.dart';
import 'package:skala_mobile/main_commons/main_constant_route.dart';
import 'package:skala_mobile/main_commons/main_size_data.dart';
import 'package:skala_mobile/main_helpers/main_article.dart';
import 'package:skala_mobile/main_routes/Pages/HomePage/widgets/main_article_detail.dart';
import 'package:skala_mobile/main_routes/Pages/HomePage/widgets/main_custom_card_widget.dart';

class MainHomePage extends StatelessWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child:  Column(children: [
          Stack(
            children: <Widget>[
              Container(
                height: height * 0.28,
                width: width,
                decoration: BoxDecoration(
                  color:MainColorData.green_dop,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left:MainSizeData.SIZE_18, top:MainSizeData.SIZE_40),
                          child: Container(
                            height:MainSizeData.SIZE_60,
                            width:MainSizeData.SIZE_60,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/logo_skala_home.png'),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top:MainSizeData.SIZE_40, right:MainSizeData.SIZE_20),
                          child: IconButton(
                            icon: const Icon(
                              Icons.notifications,
                              color:MainColorData.white,
                            ),
                            onPressed: () {
                             Get.toNamed(MainConstantRoute.mainNotifikasi);
                            },
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                           MainColorData.green_dop.withOpacity(0.0),
                           MainColorData.green_dop.withOpacity(0.0),
                           MainColorData.green_dop.withOpacity(0.1),
                           MainColorData.green_dop.withOpacity(0.5),
                           MainColorData.green_dop.withOpacity(1.0),
                          ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomLeft)),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom:MainSizeData.SIZE_90,
                left:MainSizeData.SIZE_20,
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: 'Hi FVNDAY',
                      style: TextStyle(
                        color:MainColorData.white,
                        fontSize:MainSizeData.SIZE_16,
                        fontWeight: FontWeight.w500,
                      )),
                ])),
              )
            ],
          ),
          Transform.translate(
            offset: Offset(0.0, -(height * 0.3 - height * 0.26)),
            child: Container(
              width: width,
              height:MainSizeData.SIZE_450,
              decoration: BoxDecoration(
                color:MainColorData.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(MainSizeData.SIZE_30),
                  topRight: Radius.circular(MainSizeData.SIZE_30),
                ),
              ),
              child: Column(children: <Widget>[
                SizedBox(height:MainSizeData.SIZE_30),
                SizedBox(
                    height:MainSizeData.SIZE_170,
                    width: double.infinity,
                    child: CarouselSlider(
                      options: CarouselOptions(
                        height:MainSizeData.SIZE_170,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 4),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        aspectRatio: 3.0,
                      ),
                      items: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(MainSizeData.SIZE_20),
                            image: DecorationImage(
                                image: AssetImage('assets/images/slider2.jpg'),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(MainSizeData.SIZE_20),
                            image: DecorationImage(
                                image: AssetImage('assets/images/slider1.jpg'),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(MainSizeData.SIZE_20),
                            image: DecorationImage(
                                image: AssetImage('assets/images/slider3.jpg'),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ],
                    )),
                SizedBox(height:MainSizeData.SIZE_20),
                CustomCard(onPressed: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => KlasterPage()));
                }),
                SizedBox(height:MainSizeData.SIZE_20),
                Text(
                  'Berita',
                  style: TextStyle(
                      fontSize:MainSizeData.SIZE_16,
                      fontWeight: FontWeight.w600,
                      color:MainColorData.green_dop),
                ),
              ]),
            ),
          ),
          FutureBuilder<String>(
            future: DefaultAssetBundle.of(context)
                .loadString('assets/articles.json'),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                final List<Article> articles = parseArticles(snapshot.data);
                return SizedBox(
                  height:MainSizeData.SIZE_300,
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
          )
        ]),
      ),
    );
  }
}


Widget _buildArticleItem(BuildContext context, Article article) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 18.0),
    child: GestureDetector(
      onTap: () {
        Get.to(ArticleDetailPage(article: article,));
      },
      child: Card(
        // margin: EdgeInsets.zero,
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
