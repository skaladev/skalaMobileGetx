


import 'package:get/get.dart';
import 'package:skala_mobile/main_commons/main_constant_route.dart';
import 'package:skala_mobile/main_commons/main_text_data.dart';

class MainWelcomeController extends GetxController {
  int current = 0;
  bool isWelcomeLoading = true, isRegister = true, isForgotPassword = false;
  final List<WelcomeIllustration> listOfWelcomeIllustration=[
    WelcomeIllustration(
      image: 'assets/images/slide1.png',
      description: MainTextData.textDescription1
    ),
    WelcomeIllustration(
      image: 'assets/images/slide2.png',
      description:  MainTextData.textDescription1,
    ),
    WelcomeIllustration(
      image: 'assets/images/slide2.png',
      description: MainTextData.textDescription1
    )      
  ];
  void _setIsWelcomeLoading(bool isWelcomeLoading) {
    this.isWelcomeLoading = isWelcomeLoading;
    update([MainConstantRoute.mainWelcomeId]);
  }

  void setCurrentIndex(int index) {
    current = index;
    _setIsWelcomeLoading(false);
  }
}

class WelcomeIllustration {
  String image;
  String description;

  WelcomeIllustration({
    required this.image,
    required this.description
  });
}