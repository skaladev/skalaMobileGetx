

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skala_mobile/main_routes/Pages/HomePage/main_home_page.dart';

class MainBottomNavigationController extends GetxController{
  int currentIndex = 0;
  final List<Widget> listWidget = [
       MainHomePage(),
    // MainKegiatanLainPage(),
    // MainKonsultasiPage(),
    // MainProfilePage(),
  ];
  void selectedTab (int index){
    currentIndex = index;
    update();
  }
}