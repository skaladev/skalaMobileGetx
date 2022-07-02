import 'package:flutter/material.dart';
import 'package:skala_mobile/main_commons/main_color_data.dart';
import 'package:skala_mobile/main_commons/main_size_data.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({this.label, this.hint, this.margin, Key? key})
      : super(key: key);

  final String? label;
  final String? hint;

  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          TextField(
            cursorColor: MainColorData.black,
            style: const TextStyle(
                fontSize: MainSizeData.SIZE_16,
                color: MainColorData.black,
                fontWeight: FontWeight.w400),
            decoration: InputDecoration(
              hintText: hint ?? '',
              hintStyle: const TextStyle(
                  fontSize: MainSizeData.SIZE_12,
                  color: MainColorData.grey,
                  fontWeight: FontWeight.w400),
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 1,
                  color: MainColorData.green_dop,
                ),
                borderRadius: BorderRadius.circular(MainSizeData.SIZE_24),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 1,
                  color: MainColorData.green_dop,
                ),
                borderRadius: BorderRadius.circular(MainSizeData.SIZE_24),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 1,
                  color: MainColorData.redEF,
                ),
                borderRadius: BorderRadius.circular(MainSizeData.SIZE_24),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 1,
                  color: MainColorData.grey,
                ),
                borderRadius: BorderRadius.circular(MainSizeData.SIZE_24),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 1,
                  color: MainColorData.grey,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
