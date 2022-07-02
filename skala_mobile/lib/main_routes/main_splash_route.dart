import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skala_mobile/main_commons/main_color_data.dart';
import 'package:skala_mobile/main_commons/main_constant_data.dart';
import 'package:skala_mobile/main_commons/main_size_data.dart';

class MainSplashRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: MainColorData.transparent,
      ),
      child: Scaffold(
          backgroundColor: MainColorData.white,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: MainSizeData.imageHeight200,
                  width: MainSizeData.imageWidth200,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('assets/images/logo_skala.png'),
                  )),
                ),
                const SizedBox(height: MainSizeData.SIZE_8),
                Text(
                  MainConstantData.appNames.toUpperCase(),
                  style: TextStyle(
                      fontSize: MainSizeData.fontSize12,
                      fontWeight: FontWeight.bold,
                      color: MainColorData.green_dop),
                ),
                const SizedBox(height: MainSizeData.SIZE_200),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: MainSizeData.SIZE_12),
                      child: Text(
                        MainConstantData.appText.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: MainSizeData.fontSize10,
                          fontWeight: FontWeight.w300,
                          color: MainColorData.grey75
                        ),
                      ),
                    ),
                    Text(
                      MainConstantData.copyright.toUpperCase(),
                      style: TextStyle(
                        fontSize: MainSizeData.fontSize10,
                        fontWeight: FontWeight.w300,
                        color: MainColorData.grey75
                      ),
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
