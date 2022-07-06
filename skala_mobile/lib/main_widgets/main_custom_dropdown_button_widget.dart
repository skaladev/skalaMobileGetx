import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:skala_mobile/main_commons/main_color_data.dart';
import 'package:skala_mobile/main_commons/main_size_data.dart';

class CustomDropdownButton2 extends StatelessWidget {
  final String hint;
  final String? value;
  final List<String> dropdownItems;
  final ValueChanged<String?>? onChanged;
  final DropdownButtonBuilder? selectedItemBuilder;
  final Alignment? hintAlignment;
  final Alignment? valueAlignment;
  final double? buttonHeight, buttonWidth;
  final EdgeInsetsGeometry? buttonPadding;
  final BoxDecoration? buttonDecoration;
  final int? buttonElevation;
  final Widget? icon;
  final double? iconSize;
  final Color? iconEnabledColor;
  final Color? iconDisabledColor;
  final double? itemHeight;
  final EdgeInsetsGeometry? itemPadding;
  final double? dropdownHeight, dropdownWidth;
  final EdgeInsetsGeometry? dropdownPadding;
  final BoxDecoration? dropdownDecoration;
  final int? dropdownElevation;
  final Radius? scrollbarRadius;
  final double? scrollbarThickness;
  final bool? scrollbarAlwaysShow;
  final Offset? offset;
  final String? label;
  final EdgeInsets? margin;

  const CustomDropdownButton2({
    required this.hint,
    required this.value,
    required this.dropdownItems,
    required this.onChanged,
    this.selectedItemBuilder,
    this.hintAlignment,
    this.valueAlignment,
    this.buttonHeight,
    this.buttonWidth,
    this.buttonPadding,
    this.buttonDecoration,
    this.buttonElevation,
    this.icon,
    this.iconSize,
    this.iconEnabledColor,
    this.iconDisabledColor,
    this.itemHeight,
    this.itemPadding,
    this.dropdownHeight,
    this.dropdownWidth,
    this.dropdownPadding,
    this.dropdownDecoration,
    this.dropdownElevation,
    this.scrollbarRadius,
    this.scrollbarThickness,
    this.scrollbarAlwaysShow,
    this.offset,
    this.label,
    this.margin,

    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: Container(
        margin: margin,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label ?? '',
              style: const TextStyle(
                  color: MainColorData.grey,
                  fontSize: MainSizeData.SIZE_12,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: MainSizeData.SIZE_8),
            DropdownButton2(
              //To avoid long text overflowing.
              isExpanded: true,
              hint: Container(
                alignment: hintAlignment,
                child: Text(
                  hint,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(
                      fontSize: MainSizeData.SIZE_14,
                      color: MainColorData.grey,
                      fontWeight: FontWeight.w400),
                ),
              ),
              value: value,
              items: dropdownItems
                  .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Container(
                          alignment: valueAlignment,
                          child: Text(
                            item,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: const TextStyle(
                              fontSize: MainSizeData.SIZE_14,
                              color: MainColorData.black,
                              fontWeight: FontWeight.w400
                            ),
                          ),
                        ),
                      ))
                  .toList(),
              onChanged: onChanged,
              selectedItemBuilder: selectedItemBuilder,
              icon: icon ?? const Icon(Icons.arrow_forward_ios_outlined),
              iconSize: iconSize ?? MainSizeData.SIZE_16,
              iconEnabledColor: iconEnabledColor ?? MainColorData.green_dop,
              iconDisabledColor: iconDisabledColor ?? MainColorData.grey75,
              buttonHeight: buttonHeight ?? MainSizeData.SIZE_60,
              buttonWidth: buttonWidth ?? MainSizeData.SIZE_345,
              buttonPadding:
                  buttonPadding ?? const EdgeInsets.symmetric(horizontal: MainSizeData.SIZE_16,vertical: MainSizeData.SIZE_10),
              buttonDecoration: buttonDecoration ??
                  BoxDecoration(
                    borderRadius: BorderRadius.circular(MainSizeData.SIZE_24),
                    border: Border.all(
                      color: MainColorData.grey,
                    ),
                  ),
              buttonElevation: buttonElevation,
              itemHeight: itemHeight ?? MainSizeData.SIZE_40,
              itemPadding: itemPadding ?? const EdgeInsets.only(left: 14, right: 14),
              //Max height for the dropdown menu & becoming scrollable if there are more items. If you pass Null it will take max height possible for the items.
              dropdownMaxHeight: dropdownHeight ??MainSizeData.SIZE_200,
              dropdownWidth: dropdownWidth ?? MainSizeData.SIZE_345,
              dropdownPadding: dropdownPadding,
              dropdownDecoration: dropdownDecoration ??
                  BoxDecoration(
                    borderRadius: BorderRadius.circular(MainSizeData.SIZE_14),
                  ),
              dropdownElevation: dropdownElevation ?? 8,
              scrollbarRadius: scrollbarRadius ?? const Radius.circular(MainSizeData.SIZE_40),
              scrollbarThickness: scrollbarThickness,
              scrollbarAlwaysShow: scrollbarAlwaysShow,
              //Null or Offset(0, 0) will open just under the button. You can edit as you want.
              offset: offset,
              dropdownOverButton: false, //Default is false to show menu below button
            ),
          ],
        ),
      ),
    );
  }
}
