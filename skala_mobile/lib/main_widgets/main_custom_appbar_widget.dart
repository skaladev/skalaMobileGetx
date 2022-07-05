import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:skala_mobile/main_commons/main_color_data.dart';
import 'package:skala_mobile/main_commons/main_size_data.dart';

class CustopAppBarWidget extends StatelessWidget implements PreferredSizeWidget{
  const CustopAppBarWidget(
      {Key? key,
      required this.appBar,
      this.title,
      this.titleStyle,
      this.action})
      : super(key: key);
  final AppBar appBar;
  final String? title;
  final TextStyle? titleStyle;
  final Widget? action;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title == null
          ? null
          : Text(
              title!,
              style: titleStyle ??
                  const TextStyle(
                    fontSize: MainSizeData.SIZE_14,
                    fontWeight: FontWeight.w500,
                    color: MainColorData.black,
                  ),
            ),
            backgroundColor: MainColorData.black,
            elevation: 0,
            actions: action !=null ? [action!] : null,
    );
  }
   @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
