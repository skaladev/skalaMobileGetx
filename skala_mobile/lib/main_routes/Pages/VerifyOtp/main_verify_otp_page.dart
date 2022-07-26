import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:skala_mobile/main_bloc/auth/auth_cubit.dart';
import 'package:skala_mobile/main_commons/main_color_data.dart';
import 'package:skala_mobile/main_commons/main_constant_data.dart';
import 'package:skala_mobile/main_commons/main_constant_route.dart';
import 'package:skala_mobile/main_commons/main_size_data.dart';
import 'package:skala_mobile/main_commons/main_text_data.dart';
import 'package:skala_mobile/main_helpers/main_bloc_helper.dart';
import 'package:skala_mobile/main_helpers/main_validator_helper.dart';
import 'package:skala_mobile/main_widgets/main_custom_appbar_title_widget.dart';
import 'package:skala_mobile/main_widgets/main_custom_rounded_button.dart';
import 'package:skala_mobile/main_widgets/main_custom_text_field_otp_widget.dart';

class MainVerifyOtpPage extends StatelessWidget {
  MainVerifyOtpPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _codeController = TextEditingController();
  final _mainValidatorHelper = MainValidatorHelper();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: ((previous, current) => current is AuthVerifyOtp),
      listener: (context, state) {
        if (state is AuthVerifyOtp) {
          blocHelperListenner(
            load: state.load,
            onSuccess: () {
              Get.offAllNamed(MainConstantRoute.bottomNavigationBar);
            },
          );
        }
      },
      child: Scaffold(
        appBar:
            MainCustomAppBarTitle(appBar: AppBar(), title: 'Konfirmasi OTP'),
        body: Form(
          key: _formKey,
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Icon(
                  Icons.whatsapp,
                  color: MainColorData.green18,
                ),
                SizedBox(
                  height: MainSizeData.SIZE_16,
                ),
                Text(
                  MainTextData.insertOtp,
                  style: TextStyle(
                    fontSize: MainSizeData.SIZE_16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: MainSizeData.SIZE_16),
                Text(MainTextData.sendOtp),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text(MainTextData.endOtp),
                //     TweenAnimationBuilder(
                //       tween: Tween(begin: 30.0, end: 0),
                //       duration: Duration(seconds: 60),
                //       builder: (context, value, child) {
                //         return Text('00.00',
                //             style: TextStyle(
                //                 fontSize: MainSizeData.SIZE_13,
                //                 fontWeight: FontWeight.bold,
                //                 color: Colors.red));
                //       },
                //     ),
                //   ],
                // ),
                SizedBox(height: MainSizeData.SIZE_16),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: MainSizeData.SIZE_80),
                  child: TextFieldOtp(
                    controller: _codeController,
                    validator: _mainValidatorHelper.validateBasic,
                  ),
                ),
                const SizedBox(height: MainSizeData.SIZE_16),
                const Text(
                  MainTextData.otpNotRecieved,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: MainSizeData.SIZE_12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: MainSizeData.SIZE_16),
                GestureDetector(
                  child: Text(
                    MainConstantData.resending,
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: MainSizeData.SIZE_12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Spacer(
                  flex: 3,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: MainSizeData.SIZE_16),
                  child: MainCustomRoundedButton(
                    text: MainConstantData.verifyOtp,
                    onPressed: () {
                      if (_formKey.currentState?.validate() == true) {
                        context
                            .read<AuthCubit>()
                            .verifyOTP(code: _codeController.text);
                      }
                    },
                    margin:
                        EdgeInsets.symmetric(vertical: MainSizeData.iconSize20),
                  ),
                ),
                const Spacer(
                  flex: 3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class OtpForm extends StatefulWidget {
//   const OtpForm({Key? key}) : super(key: key);

//   @override
//   State<OtpForm> createState() => _OtpFormState();
// }

// class _OtpFormState extends State<OtpForm> {
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: MainSizeData.SIZE_50),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             SizedBox(
//               height: MainSizeData.SIZE_50,
//               width: MainSizeData.SIZE_50,
//               child: TextFormField(
//                 onChanged: (value) {
//                   if (value.length == 1) {
//                     FocusScope.of(context).nextFocus();
//                   }
//                 },
//                 textAlign: TextAlign.center,
//                 style: Theme.of(context).textTheme.headline6,
//                 keyboardType: TextInputType.number,
//                 inputFormatters: [
//                   LengthLimitingTextInputFormatter(1),
//                   FilteringTextInputFormatter.digitsOnly,
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: MainSizeData.SIZE_50,
//               width: MainSizeData.SIZE_50,
//               child: TextFormField(
//                 onChanged: (value) {
//                   if (value.length == 1) {
//                     FocusScope.of(context).nextFocus();
//                   }
//                 },
//                 textAlign: TextAlign.center,
//                 style: Theme.of(context).textTheme.headline6,
//                 keyboardType: TextInputType.number,
//                 inputFormatters: [
//                   LengthLimitingTextInputFormatter(1),
//                   FilteringTextInputFormatter.digitsOnly,
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: MainSizeData.SIZE_50,
//               width: MainSizeData.SIZE_50,
//               child: TextFormField(
//                 onChanged: (value) {
//                   if (value.length == 1) {
//                     FocusScope.of(context).nextFocus();
//                   }
//                 },
//                 textAlign: TextAlign.center,
//                 style: Theme.of(context).textTheme.headline6,
//                 keyboardType: TextInputType.number,
//                 inputFormatters: [
//                   LengthLimitingTextInputFormatter(1),
//                   FilteringTextInputFormatter.digitsOnly,
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: MainSizeData.SIZE_50,
//               width: MainSizeData.SIZE_50,
//               child: TextFormField(
//                 onChanged: (value) {
//                   if (value.length == 1) {
//                     FocusScope.of(context).nextFocus();
//                   }
//                 },
//                 textAlign: TextAlign.center,
//                 style: Theme.of(context).textTheme.headline6,
//                 keyboardType: TextInputType.number,
//                 inputFormatters: [
//                   LengthLimitingTextInputFormatter(1),
//                   FilteringTextInputFormatter.digitsOnly,
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
