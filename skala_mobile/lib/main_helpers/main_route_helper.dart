import 'package:flutter/material.dart';

import 'package:get/route_manager.dart';
import 'package:skala_mobile/main_bindings/main_buttom_navigation_binding.dart';
import 'package:skala_mobile/main_bindings/main_login_binding.dart';
import 'package:skala_mobile/main_bindings/main_register_binding.dart';
import 'package:skala_mobile/main_bindings/main_splash_binding.dart';
import 'package:skala_mobile/main_bindings/main_welcome_binding.dart';
import 'package:skala_mobile/main_commons/main_constant_route.dart';
import 'package:skala_mobile/main_routes/Pages/HomePage/widgets/main_article_detail.dart';
import 'package:skala_mobile/main_routes/Pages/LoginPage/main_login_page.dart';
import 'package:skala_mobile/main_routes/Pages/NotifikasiPage/main_notifikasi_page.dart';
import 'package:skala_mobile/main_routes/Pages/RegisterPage/main_register_page.dart';
import 'package:skala_mobile/main_routes/Pages/VerifyOtp/main_verify_otp_page.dart';
import 'package:skala_mobile/main_routes/main_bottom_navbar.dart';
import 'package:skala_mobile/main_routes/main_splash_route.dart';
import 'package:skala_mobile/main_routes/main_welcome_route.dart';

class MainRouteHelper {
  factory MainRouteHelper() {
    return _mainRouteHelper;
  }
  MainRouteHelper._internal();
  static final MainRouteHelper _mainRouteHelper = MainRouteHelper._internal();
  List<GetPage> getRoute() => <GetPage>[
        GetPage(
          name: MainConstantRoute.initiateRoute,
          page: () => MainSplashRoute(),
          alignment: Alignment.center,
          transition: Transition.zoom,
          binding: MainSplashBinding(),
        ),
        GetPage(
          name: MainConstantRoute.mainWelcomeRoute,
          page: () => MainWelcomeRoute(),
          alignment: Alignment.center,
          transition: Transition.zoom,
          binding: MainWelcomeBinding(),
        ),
        GetPage(
          name: MainConstantRoute.mainLogin,
          page: () => LoginPage(),
          alignment: Alignment.center,
          transition: Transition.fadeIn,
          binding: MainLoginBinding(),
        ),
        GetPage(
            name: MainConstantRoute.mainRegister,
            page: () => MainRegisterPage(),
            alignment: Alignment.center,
            transition: Transition.fadeIn,
            binding: MainRegisterBinding()),
        GetPage(
            name: MainConstantRoute.verifyOtp,
            page: () => MainVerifyOtpPage(),
            alignment: Alignment.center,
            transition: Transition.fadeIn),
        GetPage(
            name: MainConstantRoute.bottomNavigationBar,
            page: () => MainBottomNavbar(),
            alignment: Alignment.center,
            transition: Transition.fadeIn,
            binding: MainButtomNavigationBinding()),
        GetPage(
          name: MainConstantRoute.article,
          page: () => ArticleDetailPage(),
          alignment: Alignment.center,
          transition: Transition.fadeIn,
        ),
        GetPage(
            name: MainConstantRoute.mainNotifikasi,
            page: () => MainNotifikasiPage(),
            alignment: Alignment.center,
            transition: Transition.fadeIn)
      ];
}
