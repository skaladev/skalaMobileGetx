
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/route_manager.dart';
import 'package:skala_mobile/main_commons/main_color_data.dart';
import 'package:skala_mobile/main_commons/main_size_data.dart';

class MainCustomCard extends StatelessWidget {
  const MainCustomCard({
    Key? key,
     this.itemCount,
    required this.itemTitle,
    required this.onTap,
  }) : super(key: key);

  final String ?itemCount;
  final String itemTitle;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(
            horizontal: MainSizeData.SIZE_6,
            vertical: MainSizeData.SIZE_8),
        elevation: 0,
        color: MainColorData.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(MainSizeData.SIZE_8),
          side: const BorderSide(
            color: MainColorData.green_dop,
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: MainSizeData.SIZE_16, vertical: MainSizeData.SIZE_5),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MainSizeData.SIZE_24,
                height: MainSizeData.SIZE_24,
                margin: const EdgeInsets.only(bottom: MainSizeData.SIZE_8),
                // child: SvgPicture.asset(
                //   ""
                // ),
              ),
              Flexible(
                child: Text(
                  itemCount ?? "",
                  style: const TextStyle(
                    color: MainColorData.black,
                    fontSize: MainSizeData.SIZE_28,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Text(
                itemTitle,
                style: const TextStyle(
                    color: MainColorData.grey,
                    fontSize: MainSizeData.SIZE_20,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
