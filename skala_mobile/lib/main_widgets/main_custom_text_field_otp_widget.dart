import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skala_mobile/main_commons/main_color_data.dart';
import 'package:skala_mobile/main_commons/main_constant_data.dart';
import 'package:skala_mobile/main_commons/main_size_data.dart';

class TextFieldOtp extends StatelessWidget {
  const TextFieldOtp(
      {required this.validator,
      this.label,
      this.margin,
      this.controller,
      this.errorMessage,
      Key? key})
      : super(key: key);

  final String? label;
  final TextEditingController? controller;
  final EdgeInsets? margin;
  final String? errorMessage;
  final String Function(String) validator;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MainSizeData.SIZE_8),
          TextFormField(
            controller: controller,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return errorMessage;
              }
              return null;
            },
            onChanged: (value){
              if(value.length == 4){
                FocusScope.of(context).unfocus();
              }
            },
            textAlign: TextAlign.center,
            cursorColor: MainColorData.black,
            style: Theme.of(context).textTheme.headline6,
            keyboardType: TextInputType.number,
            inputFormatters: [
              LengthLimitingTextInputFormatter(4),
              FilteringTextInputFormatter.digitsOnly,
            ]
          ),
        ],
      ),
    );
  }
}
