import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:skala_mobile/main_bloc/auth/auth_cubit.dart';
import 'package:skala_mobile/main_commons/main_color_data.dart';
import 'package:skala_mobile/main_commons/main_constant_data.dart';
import 'package:skala_mobile/main_commons/main_constant_route.dart';
import 'package:skala_mobile/main_commons/main_size_data.dart';
import 'package:skala_mobile/main_controllers/main_login_controller.dart';
import 'package:skala_mobile/main_helpers/main_bloc_helper.dart';
import 'package:skala_mobile/main_helpers/main_validator_helper.dart';
import 'package:skala_mobile/main_widgets/main_already_have_an_account_check.dart';
import 'package:skala_mobile/main_widgets/main_custom_rounded_button.dart';
import 'package:skala_mobile/main_widgets/main_custom_text_field.dart';

class LoginPage extends StatelessWidget {
  final controller = Get.find<MainLoginController>();
  final _mainValidatorHelper = MainValidatorHelper();
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) => current is AuthLogin,
      listener: (context, state) {
        if (state is AuthLogin) {
          blocHelperListenner(
            load: state.load,
            message: state.message,
            onSuccess: () {
              Get.toNamed(MainConstantRoute.verifyOtp);
              Get.snackbar('Login', 'Verifikasi Otp Telah dikirimkan');
            },
          );
        }
      },
      child: Scaffold(
          body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MainSizeData.imageHeight100,
              child: Image.asset('assets/images/logo_skala2.png'),
            ),
            const SizedBox(
              height: MainSizeData.SIZE_16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: MainSizeData.SIZE_12),
              child: Text(
                MainConstantData.appNames,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: MainColorData.green_dop),
              ),
            ),
            const SizedBox(
              height: MainSizeData.SIZE_60,
            ),
            Form(
              key: controller.loginFormKey,
              child: CustomTextField(
                validator: _mainValidatorHelper.validatePhoneNumber,
                controller: controller.noWhatshapp..text = '6285801482929',
                errorMessage: MainConstantData.required,
                label: "No Whatshapp",
                hint: "62xxxxxxxxxxx",
                margin: EdgeInsets.symmetric(horizontal: MainSizeData.SIZE_24),
              ),
            ),
            MainCustomRoundedButton(
                // onPressed:controller.login,
                onPressed: () {
                  if (controller.loginFormKey.currentState?.validate() ==
                      true) {
                    context.read<AuthCubit>().login(
                          noHp: controller.noWhatshapp.text,
                        );
                  }
                },
                margin: EdgeInsets.symmetric(
                    vertical: MainSizeData.SIZE_24,
                    horizontal: MainSizeData.SIZE_14),
                text: MainConstantData.login.toUpperCase()),
            MainAlreadyHaveAnAccountCheck(
              login: true,
              OnPressed: () {
                Get.toNamed(MainConstantRoute.mainRegister);
              },
            )
          ],
        ),
      )),
    );
  }
}
