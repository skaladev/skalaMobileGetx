import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skala_mobile/main_commons/main_color_data.dart';
import 'package:skala_mobile/main_commons/main_size_data.dart';

class MainCustomAppBarTitle extends StatelessWidget
    implements PreferredSizeWidget {
  const MainCustomAppBarTitle(
      {this.appBar,
      this.title,
      this.onPressed,
      this.isIconEnabled = true,
      this.titleStyle,
      this.action,
      this.color,
      Key? key})
      : super(key: key);
  final AppBar? appBar;
  final String? title;
  final TextStyle? titleStyle;
  final bool isIconEnabled;
  final Function()? onPressed;
  final Widget? action;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: isIconEnabled
          ? Padding(
              padding: const EdgeInsets.only(left: MainSizeData.SIZE_14),
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: MainColorData.black,
                  size: MainSizeData.SIZE_20,
                ),
                onPressed: onPressed ??
                    () {
                      // Navigator.pop(context);
                      Get.back();
                    },
              ),
            )
          : null,
      title: title == null
          ? null
          : Text(
              title!,
              style: titleStyle ??
                  const TextStyle(
                      fontSize: MainSizeData.SIZE_14,
                      fontWeight: FontWeight.w500,
                      color: MainColorData.black),
            ),
      leadingWidth: MainSizeData.SIZE_50,
      backgroundColor: color ?? Colors.transparent,
      elevation: 0,
      actions: action != null ? [action!] : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
