import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as bloc;

import 'package:get/route_manager.dart';
import 'package:skala_mobile/main_bindings/main_add_konsultasi_binding.dart';
import 'package:skala_mobile/main_bindings/main_buttom_navigation_binding.dart';
import 'package:skala_mobile/main_bindings/main_edit_profile_binding.dart';
import 'package:skala_mobile/main_bindings/main_login_binding.dart';
import 'package:skala_mobile/main_bindings/main_register_binding.dart';
import 'package:skala_mobile/main_bindings/main_splash_binding.dart';
import 'package:skala_mobile/main_bindings/main_welcome_binding.dart';
import 'package:skala_mobile/main_bloc/auth/auth_cubit.dart';
import 'package:skala_mobile/main_bloc/konsultasi/konsultasi_cubit.dart';
import 'package:skala_mobile/main_bloc/ref/ref_cubit.dart';
import 'package:skala_mobile/main_commons/main_constant_route.dart';
import 'package:skala_mobile/main_routes/Pages/HomePage/widgets/main_article_detail.dart';
import 'package:skala_mobile/main_routes/Pages/KonsultasiPage/main_add_kosultasi_page.dart';
import 'package:skala_mobile/main_routes/Pages/LoginPage/main_login_page.dart';
import 'package:skala_mobile/main_routes/Pages/NotifikasiPage/main_notifikasi_page.dart';
import 'package:skala_mobile/main_routes/Pages/ProfilePage/main_edit_profile_page.dart';
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
          page: () => bloc.BlocProvider(
            create: (context) => AuthCubit(),
            child: LoginPage(),
          ),
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
            page: () => bloc.BlocProvider(
                  create: (context) => AuthCubit(),
                  child: MainVerifyOtpPage(),
                ),
            alignment: Alignment.center,
            transition: Transition.fadeIn),
        GetPage(
            name: MainConstantRoute.bottomNavigationBar,
            page: () =>bloc.MultiBlocProvider(
                  providers: [
                   bloc.BlocProvider(create: (context) => KonsultasiCubit()),
                   bloc.BlocProvider(create: (context)=>RefCubit())
                  ],
                  child: MainBottomNavbar(),
                ),
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
            transition: Transition.fadeIn),
        GetPage(
          name: MainConstantRoute.mainEditProfile,
          page: () => MainEditProfilePage(),
          alignment: Alignment.center,
          transition: Transition.fadeIn,
          binding: MainEditProfileBinding(),
        ),
        GetPage(
            name: MainConstantRoute.mainAddKonsultasi,
            page: () => bloc.BlocProvider(
                  create: (context) => KonsultasiCubit(),
                  child: MainAddKonsultasiPage(),
                ),
            alignment: Alignment.center,
            transition: Transition.fadeIn,
            binding: MainAddKosultasiBinding())
      ];
}
