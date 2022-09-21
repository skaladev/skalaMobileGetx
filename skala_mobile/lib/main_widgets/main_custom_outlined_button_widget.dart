import 'package:flutter/material.dart';
import 'package:skala_mobile/main_commons/main_color_data.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    Key? key,
    required this.text,
    this.icon,
    this.borderWidth,
    this.textStyle,
    this.onPressed,
    this.margin,
    this.borderColor,
    this.textColor,
  }) : super(key: key);

  final Icon? icon;
  final String text;
  final TextStyle? textStyle;
  final double? borderWidth;
  final Function()? onPressed;
  final EdgeInsets? margin;
  final Color? borderColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: margin,
      height: size.height * 0.06,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            color: borderColor ?? MainColorData.green_dop,
            width: borderWidth ?? 2,
          ),
          shape: const StadiumBorder(),
        ),
        child: icon == null
            ? Text(
                text.toUpperCase(),
                style: textStyle ??
                    TextStyle(
                      color: textColor ?? MainColorData.green_dop,
                      fontWeight: FontWeight.w700,
                    ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  icon!,
                  Text(
                    text.toUpperCase(),
                    style: textStyle ??
                        TextStyle(
                          color: textColor ?? MainColorData.green_dop,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                ],
              ),
      ),
    );
  }
}
