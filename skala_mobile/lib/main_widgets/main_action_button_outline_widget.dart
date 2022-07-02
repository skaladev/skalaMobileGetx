import 'package:flutter/material.dart';
import 'package:skala_mobile/main_commons/main_color_data.dart';
import 'package:skala_mobile/main_commons/main_size_data.dart';
import 'package:skala_mobile/main_widgets/main_custom_text_widget.dart';

class MainActionButtonOutlineWidget extends StatelessWidget {
  const MainActionButtonOutlineWidget({
    required this.onPressed,
    required this.text,
    this.textColor = MainColorData.primary,
    this.borderColor = MainColorData.primary,
    this.alignment = Alignment.center,
    this.borderRadius = 5.0,
    this.isText = true,
    this.iconColor = MainColorData.green_dop,
    Key? key,
  }) : super(key: key);

  final Function onPressed;
  final String text;
  final Color textColor, borderColor, iconColor;
  final Alignment alignment;
  final double borderRadius;
  final bool isText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
        height: 45.0,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        decoration: BoxDecoration(
          color: MainColorData.white,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(
            color: borderColor,
          ),
        ),
        child: Align(
          alignment: alignment,
          child: isText
              ? MainCustomTextWidget(
                  text: text,
                  color: textColor,
                  iconColor: iconColor,
                  fontSize: MainSizeData.fontSize16,
                  fontWeight: FontWeight.bold,
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.camera_alt_outlined,
                      color: MainColorData.primary,
                      size: 25.0,
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    MainCustomTextWidget(
                      text: text,
                      iconColor: MainColorData.green_dop,
                      color: textColor,
                      fontSize: MainSizeData.fontSize16,
                      fontWeight: FontWeight.bold,
                    )
                  ],
                ),
        ),
      ),
    );
  }
}