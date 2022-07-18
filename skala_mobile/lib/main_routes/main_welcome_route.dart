


import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skala_mobile/main_commons/main_color_data.dart';
import 'package:skala_mobile/main_commons/main_constant_route.dart';
import 'package:skala_mobile/main_commons/main_size_data.dart';
import 'package:skala_mobile/main_controllers/main_app_controller.dart';
import 'package:skala_mobile/main_controllers/main_welcome_controller.dart';
import 'package:skala_mobile/main_helpers/main_exit_app_helper.dart';
import 'package:skala_mobile/main_widgets/main_scroll_body_widget.dart';

class MainWelcomeRoute extends StatelessWidget {
  final MainAppController _mainAppController = Get.find<MainAppController>();
  final MainExitAppHelper _mainExitAppHelper = MainExitAppHelper();
  final MainWelcomeController _mainWelcomeController =
      Get.find<MainWelcomeController>();

  @override
  Widget build(BuildContext context) {
    final GetBuilder<MainWelcomeController> _carouselWidget =
            GetBuilder<MainWelcomeController>(
          id: MainConstantRoute.mainWelcomeId,
          builder: (mainWelcomeController) => CarouselSlider(
            options: CarouselOptions(
              height: 400.0,
              viewportFraction: 1.0,
              autoPlay: true,
              onPageChanged: (index, reason) {
                mainWelcomeController.setCurrentIndex(index);
              },
            ),
            items: mainWelcomeController.listOfWelcomeIllustration
                .map(
                  (element) => Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: MainSizeData.padding16,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          element.image,
                          height: MainSizeData.imageHeight300,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Text(
                          element.description,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: MainSizeData.SIZE_12,
                            fontWeight: FontWeight.w200,
                            color: MainColorData.black
                          ) ,
                        )
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        _indicatorWidget = GetBuilder<MainWelcomeController>(
          id: MainConstantRoute.mainWelcomeId,
          builder: (mainWelcomeController) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: mainWelcomeController.listOfWelcomeIllustration.map(
              (item) {
                final int index = mainWelcomeController
                    .listOfWelcomeIllustration
                    .indexOf(item);
                return mainWelcomeController.current == index
                    ? Container(
                        width: 18.0,
                        height: 6.0,
                        margin: const EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 2.0,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: MainColorData.green_dop,
                        ),
                      )
                    : Container(
                        width: 4.0,
                        height: 4.0,
                        margin: const EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 2.0,
                        ),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: MainColorData.greyCA,
                        ),
                      );
              },
            ).toList(),
          ),
        );

    return WillPopScope(
      onWillPop: () async => _mainExitAppHelper.exitApp(_mainAppController),
      child: Scaffold(
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: MainScrollBodyWidget(
                padding: const EdgeInsets.fromLTRB(
                  MainSizeData.padding16,
                  MainSizeData.padding100,
                  MainSizeData.padding16,
                  MainSizeData.padding200,
                ),
                body: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _carouselWidget,
                    const SizedBox(
                      height: 40,
                    ),
                    _indicatorWidget,
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: MainSizeData.SIZE_90),
              child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(MainConstantRoute.mainLogin);
                    // Get.toNamed(MainConstantRoute.bottomNavigationBar);
                  },
                  child: Text(
                    'Mulai',
                    style: TextStyle(
                      fontSize: MainSizeData.fontSize14,
                      fontWeight: FontWeight.bold,
                      color: MainColorData.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: MainColorData.green_dop,
                    padding: EdgeInsets.symmetric(
                      horizontal: MainSizeData.SIZE_28,
                      vertical: MainSizeData.SIZE_12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(MainSizeData.SIZE_8),
                    ),
                  ),
                ),
            )
          ],
        ),
      ),
    );
  }
}
