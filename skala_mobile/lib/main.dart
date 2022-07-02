import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:skala_mobile/main_bindings/main_initial_binding.dart';
import 'package:skala_mobile/main_commons/main_constant_data.dart';
import 'package:skala_mobile/main_commons/main_constant_route.dart';
import 'package:skala_mobile/main_commons/main_theme_data.dart';
import 'package:skala_mobile/main_helpers/main_route_helper.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await dot_env.load();
  Intl.defaultLocale = 'id_ID';
  await initializeDateFormatting('id_ID').then(
    (_) => runApp(
      MyApp(),
    ),
  );

  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MainThemeData _mainThemeData = MainThemeData();
    final MainRouteHelper _routeHelper = MainRouteHelper();
    
    return GetMaterialApp(
      title: MainConstantData.appName,
      theme: _mainThemeData.lightTheme,
      debugShowCheckedModeBanner: false,
      darkTheme: _mainThemeData.darkTheme,
      themeMode: ThemeMode.light,
      initialRoute: MainConstantRoute.initiateRoute,
      transitionDuration: const Duration(milliseconds: 200),
      defaultTransition: Transition.rightToLeftWithFade,
      initialBinding: MainInitialBinding(),
      getPages: _routeHelper.getRoute(),
    );
  }
}
