import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/route_manager.dart';
import 'package:hive/hive.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:skala_mobile/firebase_options.dart';
import 'package:skala_mobile/main_bindings/main_initial_binding.dart';
import 'package:skala_mobile/main_commons/main_constant_data.dart';
import 'package:skala_mobile/main_commons/main_constant_route.dart';
import 'package:skala_mobile/main_commons/main_theme_data.dart';
import 'package:skala_mobile/main_helpers/main_route_helper.dart';

Future<void> _firebaseMessagingBackgroundHandler(message) async {
  await Firebase.initializeApp();
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await dotenv.load();
  final directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  await Hive.openBox(MainConstantData.mainBox);
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

  MainInitialBinding().dependencies();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MainThemeData mainThemeData = MainThemeData();
    final MainRouteHelper routeHelper = MainRouteHelper();

    return GetMaterialApp(
      title: MainConstantData.appName,
      builder: EasyLoading.init(),
      theme: mainThemeData.lightTheme,
      debugShowCheckedModeBanner: false,
      darkTheme: mainThemeData.darkTheme,
      themeMode: ThemeMode.light,
      initialRoute: MainConstantRoute.initiateRoute,
      transitionDuration: const Duration(milliseconds: 200),
      defaultTransition: Transition.rightToLeftWithFade,
      // initialBinding: MainInitialBinding(),
      getPages: routeHelper.getRoute(),
    );
  }
}
