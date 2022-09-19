import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skala_mobile/main_commons/main_color_data.dart';
import 'package:skala_mobile/main_commons/main_size_data.dart';
import 'package:skala_mobile/main_controllers/main_app_controller.dart';
import 'package:skala_mobile/main_prefs/prefs.dart';
import 'package:skala_mobile/main_routes/Pages/HomePage/main_home_page.dart';
import 'package:skala_mobile/main_routes/Pages/KonsultasiPage/main_konsultasi_page.dart';
import 'package:skala_mobile/main_routes/Pages/KonsultasiPraktisiPage/main_konsultasi_praktisi_page.dart';
import 'package:skala_mobile/main_routes/Pages/ProfilePage/main_profile_page.dart';

class MainBottomNavbar extends StatefulWidget {
  final MainAppController _mainAppController = Get.find<MainAppController>();
  MainBottomNavbar({Key? key}) : super(key: key);

  @override
  State<MainBottomNavbar> createState() => _MainBottomNavbarState();
}

class _MainBottomNavbarState extends State<MainBottomNavbar> {
  int _currentIndex = Get.arguments?['index'] ?? 0;
  final _prefs = Prefs();

  @override
  Widget build(BuildContext context) {
    final List<Widget> items = [
      MainHomePage(),
      // MainKegiatanLainPage(),
      const MainKonsultasiPraktisiPage(),
      if (_prefs.roleId != 6) const MainKonsultasiPage(),
      MainProfilePage(),
    ];

    return Scaffold(
      body: items[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          iconSize: MainSizeData.SIZE_24,
          unselectedFontSize: MainSizeData.SIZE_10,
          selectedFontSize: MainSizeData.SIZE_10,
          selectedItemColor: MainColorData.green_dop,
          unselectedItemColor: MainColorData.black,
          items: <BottomNavigationBarItem>[
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: MainColorData.grey,
              ),
              activeIcon: Icon(
                Icons.home_filled,
                color: MainColorData.green_dop,
              ),
              label: 'Home',
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.work_outline_outlined,
                color: MainColorData.grey,
              ),
              activeIcon: Icon(
                Icons.work,
                color: MainColorData.green_dop,
              ),
              label: 'Konsultasi',
            ),
            if (_prefs.roleId != 6)
              const BottomNavigationBarItem(
                icon: Icon(
                  Icons.message_outlined,
                  color: MainColorData.grey,
                ),
                activeIcon: Icon(
                  Icons.message,
                  color: MainColorData.green_dop,
                ),
                label: 'Lapor',
              ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outlined,
                color: MainColorData.grey,
              ),
              activeIcon: Icon(
                Icons.person,
                color: MainColorData.green_dop,
              ),
              label: 'Profile',
            ),
          ]),
    );
  }
}
