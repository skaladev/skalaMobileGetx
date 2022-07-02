
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:skala_mobile/main_commons/main_color_data.dart';
import 'package:skala_mobile/main_commons/main_size_data.dart';

class MainCustomRoundedButton extends StatelessWidget {
  const MainCustomRoundedButton({
    required this.onPressed,
    required this.text,
    this.icon,
    required this.margin,
    this.isEnable = true,
    
    Key? key}) : super(key: key);
    final String text;
    final Icon? icon;
    final Function()?onPressed;
    final bool isEnable;
    final EdgeInsets margin;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text.toUpperCase(),
          style: TextStyle(
            fontSize: MainSizeData.SIZE_14,
            fontWeight: FontWeight.bold,
            color: MainColorData.white,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: MainColorData.green_dop,
          padding: EdgeInsets.symmetric(
            horizontal: MainSizeData.SIZE_28,
            vertical: MainSizeData.SIZE_12,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(MainSizeData.SIZE_8),
          ),
        ),
      ),
    );
  }
}