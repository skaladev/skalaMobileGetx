import 'package:flutter/material.dart';
import 'package:skala_mobile/main_commons/main_color_data.dart';
import 'package:skala_mobile/main_commons/main_size_data.dart';

class MainCategoryCard extends StatelessWidget {
  const MainCategoryCard({
    required this.label,
    required this.onTap,
    Key? key,
  }) : super(key: key);
  final String? label;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(
            horizontal: MainSizeData.SIZE_6, vertical: MainSizeData.SIZE_8),
        elevation: 0,
        color: MainColorData.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(MainSizeData.SIZE_8),
          side: const BorderSide(
            color: MainColorData.green_dop,
            width: 1,
          ),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: MainSizeData.SIZE_18, vertical: MainSizeData.SIZE_10),
          decoration: BoxDecoration(
            color: MainColorData.white,
            borderRadius: BorderRadius.circular(MainSizeData.SIZE_20),
          ),
          child: Text(
            label!.toUpperCase(),
            style: const TextStyle(
                color: MainColorData.grey,
                fontSize: MainSizeData.SIZE_13,
                fontWeight: FontWeight.w900),
          ),
        ),
      ),
    );
  }
}
