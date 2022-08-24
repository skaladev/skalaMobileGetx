import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as bloc;

import 'package:get/route_manager.dart';
import 'package:skala_mobile/main_bindings/main_add_konsultasi_binding.dart';
import 'package:skala_mobile/main_bindings/main_buttom_navigation_binding.dart';
import 'package:skala_mobile/main_bindings/main_edit_profile_binding.dart';
import 'package:skala_mobile/main_bindings/main_kategori_konsultasi.dart';
import 'package:skala_mobile/main_bindings/main_kla_binding.dart';
import 'package:skala_mobile/main_bindings/main_konsultasi_menu_binding.dart';
import 'package:skala_mobile/main_bindings/main_konsultasi_praktisi_bio_binding.dart';
import 'package:skala_mobile/main_bindings/main_konsultasi_praktisi_detail_binding.dart';
import 'package:skala_mobile/main_bindings/main_konsultasi_praktisi_form_binding.dart';
import 'package:skala_mobile/main_bindings/main_list_praktisi.dart';
import 'package:skala_mobile/main_bindings/main_login_binding.dart';
import 'package:skala_mobile/main_bindings/main_register_binding.dart';
import 'package:skala_mobile/main_bindings/main_splash_binding.dart';
import 'package:skala_mobile/main_bindings/main_welcome_binding.dart';
import 'package:skala_mobile/main_bloc/auth/auth_cubit.dart';
import 'package:skala_mobile/main_bloc/consultations/consultation_cubit.dart';
import 'package:skala_mobile/main_bloc/konsultasi/konsultasi_cubit.dart';
import 'package:skala_mobile/main_bloc/profile/profile_cubit.dart';
import 'package:skala_mobile/main_bloc/ref/ref_cubit.dart';
import 'package:skala_mobile/main_commons/main_constant_route.dart';
import 'package:skala_mobile/main_routes/Pages/HomePage/widgets/main_article_detail.dart';
import 'package:skala_mobile/main_routes/Pages/KonsultasiPage/main_add_kosultasi_page.dart';
import 'package:skala_mobile/main_routes/Pages/KonsultasiPraktisiPage/main_konsultasi_list_praktisi_page.dart';
import 'package:skala_mobile/main_routes/Pages/KonsultasiPraktisiPage/main_konsultasi_praktisi_bio.dart';
import 'package:skala_mobile/main_routes/Pages/KonsultasiPraktisiPage/main_konsultasi_praktisi_detail_page.dart';
import 'package:skala_mobile/main_routes/Pages/KonsultasiPraktisiPage/main_konsultasi_praktisi_form_page.dart';
import 'package:skala_mobile/main_routes/Pages/LoginPage/main_login_page.dart';
import 'package:skala_mobile/main_routes/Pages/MenuPage/categories/main_kesehatan_mental_page.dart';
import 'package:skala_mobile/main_routes/Pages/MenuPage/kla_page.dart';
import 'package:skala_mobile/main_routes/Pages/MenuPage/konsultasi_page.dart';
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
            page: () => bloc.BlocProvider(
                  create: (context) => AuthCubit(),
                  child: MainRegisterPage(),
                ),
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
            page: () => bloc.MultiBlocProvider(
                  providers: [
                    bloc.BlocProvider(create: (context) => KonsultasiCubit()),
                    bloc.BlocProvider(create: (context) => RefCubit()),
                    bloc.BlocProvider(create: (context) => ProfileCubit()),
                    bloc.BlocProvider(
                      create: (context) => ConsultationCubit(),
                    )
                  ],
                  child: MainBottomNavbar(),
                ),
            alignment: Alignment.center,
            transition: Transition.fadeIn,
            binding: MainButtomNavigationBinding()),
        GetPage(
          name: MainConstantRoute.article,
          page: () => const ArticleDetailPage(),
          alignment: Alignment.center,
          transition: Transition.fadeIn,
        ),
        GetPage(
            name: MainConstantRoute.mainNotifikasi,
            page: () => const MainNotifikasiPage(),
            alignment: Alignment.center,
            transition: Transition.fadeIn),
        GetPage(
          name: MainConstantRoute.mainEditProfile,
          page: () => bloc.MultiBlocProvider(
            providers: [
              bloc.BlocProvider(create: (context) => RefCubit()),
              bloc.BlocProvider(create: (context) => ProfileCubit()),
            ],
            child: MainEditProfilePage(),
          ),
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
            binding: MainAddKosultasiBinding()),
        GetPage(
          name: MainConstantRoute.mainListPraktisi,
          page: () => bloc.BlocProvider(
            create: (context) => ConsultationCubit(),
            child: const MainKonsultasiListPraktisi(),
          ),
          alignment: Alignment.center,
          transition: Transition.fadeIn,
          binding: MainListPraktisiBinding(),
        ),
        GetPage(
            name: MainConstantRoute.mainKonsultasiPraktisiBio,
            page: () => bloc.BlocProvider(
                  create: (context) => ConsultationCubit(),
                  child: const MainKonsultasiPraktisiBio(),
                ),
            alignment: Alignment.center,
            transition: Transition.fadeIn,
            binding: MainKosultasiPraktisiBioBinding()),
        GetPage(
            name: MainConstantRoute.mainKonsultasiPraktisiForm,
            page: () => bloc.BlocProvider(
                  create: (context) => ConsultationCubit(),
                  child: const MainKonsultasiPraktisiForm(),
                ),
            alignment: Alignment.center,
            transition: Transition.fadeIn,
            binding: MainKosultasiPraktisiFormBinding()),
        GetPage(
            name: MainConstantRoute.mainKla,
            page: () => const KlaPage(),
            alignment: Alignment.center,
            transition: Transition.fadeIn,
            binding: MainKlaBinding()),
        GetPage(
            name: MainConstantRoute.mainKonsultasiPraktisiDetail,
            page: () => bloc.BlocProvider(
                  create: (context) => ConsultationCubit(),
                  child: MainKonsultasiPraktisiDetailPage(),
                ),
            alignment: Alignment.center,
            transition: Transition.fadeIn,
            binding: MainKosultasiPraktisiDetailBinding()),
        GetPage(
            name: MainConstantRoute.mainMenuKonsultasi,
            page: () => const MainMenuKonsultasiPage(),
            alignment: Alignment.center,
            transition: Transition.fadeIn,
            binding: MainKonsultasiMenuBinding()),
        GetPage(
            name: MainConstantRoute.mainKesehatanMental,
            page: () => const MainKesehatanMentalPage(),
            alignment: Alignment.center,
            transition: Transition.fadeIn,
            binding: MainKategoriKonsultasiBinding()),
      ];
}
