import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/route_manager.dart';
import 'package:hive/hive.dart';
import 'package:skala_mobile/main_commons/main_color_data.dart';
import 'package:skala_mobile/main_commons/main_constant_route.dart';
import 'package:skala_mobile/main_commons/main_size_data.dart';
import 'package:skala_mobile/main_helpers/main_article.dart';
import 'package:skala_mobile/main_prefs/prefs.dart';
import 'package:skala_mobile/main_routes/Pages/HomePage/widgets/main_article_detail.dart';
import 'package:skala_mobile/main_routes/Pages/HomePage/widgets/main_custom_card_widget.dart';
import 'package:skala_mobile/main_routes/Pages/MenuPage/konsultasi_page.dart';

class MainHomePage extends StatelessWidget {
  final _prefs = Prefs();
  MainHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            HeaderWithSearchBox(size: size),
            SizedBox(height: MainSizeData.SIZE_16),
            SizedBox(
                height: MainSizeData.SIZE_170,
                width: double.infinity,
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: MainSizeData.SIZE_170,
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
                            image: AssetImage('assets/images/slider_1.png'),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(MainSizeData.SIZE_20),
                        image: DecorationImage(
                            image: AssetImage('assets/images/slider_2.png'),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(MainSizeData.SIZE_20),
                        image: DecorationImage(
                            image: AssetImage('assets/images/slider_3.png'),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ],
                )),
            SizedBox(height: MainSizeData.SIZE_20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                itemMenuHome(
                  title: "Tentang KLA",
                  icon: "assets/icons/ic_horse.svg",
                  onPressed: () {
                    Get.toNamed(MainConstantRoute.mainKla);
                  },
                ),
                itemMenuHome(
                  title: "Konsultasi",
                  icon: "assets/icons/ic_checklist.svg",
                  onPressed: () {
                    Get.toNamed(MainConstantRoute.mainMenuKonsultasi);
                  },
                ),
                if (_prefs.roleId != 6)
                  itemMenuHome(
                    title: "Aduan",
                    icon: "assets/icons/ic_coding.svg",
                    onPressed: () {
                      Get.toNamed(MainConstantRoute.mainAduan);
                    },
                  ),
              ],
            ),
            // CustomCard(onPressed: () {
            //   // Navigator.push(context,
            //   //     MaterialPageRoute(builder: (context) => KlasterPage()));
            // }),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: MainSizeData.SIZE_12),
              child: Text(
                'Berita',
                style: TextStyle(
                    fontSize: MainSizeData.SIZE_16,
                    fontWeight: FontWeight.w600,
                    color: MainColorData.green_dop),
              ),
            ),
            FutureBuilder<String>(
              future: DefaultAssetBundle.of(context)
                  .loadString('assets/articles.json'),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  final List<Article> articles = parseArticles(snapshot.data);
                  return SizedBox(
                    height: MainSizeData.SIZE_500,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
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
          ],
        ),
      ),
    );
  }
}

class itemMenuHome extends StatelessWidget {
  const itemMenuHome({
    required this.title,
    required this.icon,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final String title;
  final String icon;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: MainSizeData.SIZE_18),
        child: Column(
          children: [
            Container(
              width: MainSizeData.SIZE_50,
              height: MainSizeData.SIZE_50,
              child: SvgPicture.asset(
                icon,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: MainSizeData.SIZE_5),
            Text(
              title,
              style: TextStyle(
                  fontSize: MainSizeData.SIZE_12,
                  fontWeight: FontWeight.bold,
                  color: MainColorData.green_dop),
            )
          ],
        ),
      ),
    );
  }
}

class HeaderWithSearchBox extends StatelessWidget {
  const HeaderWithSearchBox({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: MainSizeData.SIZE_4),
      height: size.height * 0.3,
      child: Stack(
        children: <Widget>[
          Container(
            height: size.height * 0.3 - 27,
            decoration: BoxDecoration(
              color: MainColorData.green_dop,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: MainSizeData.SIZE_30,
                          top: MainSizeData.SIZE_40),
                      child: Container(
                        height: MainSizeData.SIZE_60,
                        width: MainSizeData.SIZE_60,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image:
                                AssetImage('assets/images/logo_skala_home.png'),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: MainSizeData.SIZE_40,
                          right: MainSizeData.SIZE_20),
                      child: IconButton(
                        icon: const Icon(
                          Icons.notifications,
                          color: MainColorData.white,
                        ),
                        onPressed: () {
                          Get.toNamed(MainConstantRoute.mainNotifikasi);
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Positioned(
            bottom: MainSizeData.SIZE_90,
            left: MainSizeData.SIZE_30,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Selamat Datang,',
                  style: TextStyle(
                    color: MainColorData.white,
                    fontSize: MainSizeData.SIZE_16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Di Aplikasi Kota Layak Anak Surakarta',
                  style: TextStyle(
                    color: MainColorData.white,
                    fontSize: MainSizeData.SIZE_16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
              // text:
            ),
          ),
          Positioned(
            bottom: -25,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.symmetric(
                  horizontal: MainSizeData.SIZE_18,
                  vertical: MainSizeData.SIZE_30),
              height: MainSizeData.SIZE_54,
              decoration: BoxDecoration(
                color: MainColorData.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 5),
                      blurRadius: 5,
                      color: MainColorData.green_dop.withOpacity(0.5))
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: MainSizeData.SIZE_18,
                    vertical: MainSizeData.SIZE_16),
                child: TextField(
                    decoration: InputDecoration(
                        hintText: "Search",
                        hintStyle: TextStyle(
                            fontSize: MainSizeData.SIZE_12,
                            fontWeight: FontWeight.w400,
                            color: MainColorData.green_dop.withOpacity(0.5)),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        suffixIcon: Icon(
                          Icons.search,
                          color: MainColorData.green_dop.withOpacity(0.5),
                        ))),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildArticleItem(BuildContext context, Article article) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 18.0),
    child: GestureDetector(
      onTap: () {
        Get.to(ArticleDetailPage(
          article: article,
        ));
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
