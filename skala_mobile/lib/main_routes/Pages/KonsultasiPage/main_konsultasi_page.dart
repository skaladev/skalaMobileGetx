
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/route_manager.dart';
import 'package:skala_mobile/main_commons/main_color_data.dart';
import 'package:skala_mobile/main_commons/main_constant_route.dart';
import 'package:skala_mobile/main_commons/main_size_data.dart';
import 'package:skala_mobile/main_widgets/main_custom_appbar_title_widget.dart';

class MainKonsultasiPage extends StatelessWidget {
  const MainKonsultasiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor:  MainColorData.white,
      appBar: MainCustomAppBarTitle(
        title: "Konsultasi",
        isIconEnabled: false,
        titleStyle: const TextStyle(
          color: MainColorData.black,
          fontSize: MainSizeData.fontSize16,
          fontWeight: FontWeight.bold
        ),
      ),
      body: SingleChildScrollView(

      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: MainSizeData.SIZE_10,bottom: MainSizeData.SIZE_12),
        child: FloatingActionButton(
          onPressed: (){
            Get.toNamed(MainConstantRoute.mainAddKonsultasi);
          },
          child: Icon(Icons.add),
          backgroundColor: MainColorData.green_dop,
        ),
      ),
    );
  }
}