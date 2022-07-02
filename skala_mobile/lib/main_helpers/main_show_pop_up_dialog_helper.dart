
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:skala_mobile/main_commons/main_color_data.dart';
import 'package:skala_mobile/main_commons/main_text_data.dart';

class MainShowPopUpDialogHelper {
  factory MainShowPopUpDialogHelper() {
    return _mainShowPopUpDialogHelper;
  }

  MainShowPopUpDialogHelper._internal();

  static final MainShowPopUpDialogHelper _mainShowPopUpDialogHelper =
      MainShowPopUpDialogHelper._internal();

  void showPopUpDialog({
    required String title,
    required String content,
    String textConfirm = MainTextData.textOk,
    bool isWithButton = true,
    bool isSingleBack = true,
    required Function() onConfirm,
  }) {
    isWithButton
        ? Get.defaultDialog(
            title: title,
            titleStyle: const TextStyle(
              color: MainColorData.grey42,
              fontSize: 20.0,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
            ),
            middleText: content,
            middleTextStyle: const TextStyle(
              color: MainColorData.grey,
              fontSize: 15.0,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
            ),
            backgroundColor: MainColorData.white,
            barrierDismissible: false,
            onWillPop: () async => false,
            radius: 8.0,
            buttonColor: MainColorData.greyEE,
            textConfirm: textConfirm,
            confirmTextColor: MainColorData.grey42,
            // onConfirm: onConfirm ??
            //     () {
            //       if (isSingleBack) {
            //         Get.back();
            //       } else {
            //         Get.back();
            //         Get.back();
            //       }
            //     },
          )
        : Get.defaultDialog(
            title: title,
            titleStyle: const TextStyle(
              color: MainColorData.grey42,
              fontSize: 20.0,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
            ),
            middleText: content,
            middleTextStyle: const TextStyle(
              color: MainColorData.grey,
              fontSize: 15.0,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
            ),
            backgroundColor: MainColorData.white,
            barrierDismissible: false,
            onWillPop: () async => false,
            radius: 8.0,
          );
  }
}
