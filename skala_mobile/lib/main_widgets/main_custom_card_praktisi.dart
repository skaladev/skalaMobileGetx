import 'package:flutter/material.dart';
import 'package:skala_mobile/main_commons/main_color_data.dart';
import 'package:skala_mobile/main_commons/main_size_data.dart';

class MainCustomCardPraktisi extends StatelessWidget {
  const MainCustomCardPraktisi({
    required this.itemName,
    required this.itemCategory,
    required this.itemImage,
    required this.onPressed,
    Key? key,
  }) : super(key: key);
  final String itemName;
  final String itemCategory;
  final String itemImage;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MainSizeData.SIZE_130,
      child: Stack(children: [
        Positioned(
          top: 0,
          left: MainSizeData.SIZE_30,
          child: Material(
            child: Container(
              height: MainSizeData.SIZE_120,
              width: MainSizeData.SIZE_300,
              decoration: BoxDecoration(
                  color: MainColorData.white,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      color: MainColorData.grey.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 3,
                    )
                  ]),
            ),
          ),
        ),
        Positioned(
          top: -4,
          left: 26,
          child: Card(
            shadowColor: MainColorData.grey.withOpacity(0.5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Container(
              height: MainSizeData.SIZE_120,
              width: MainSizeData.SIZE_120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                      image:  AssetImage(itemImage))),
            ),
          ),
        ),
        Positioned(
          top: MainSizeData.SIZE_16,
          left: MainSizeData.SIZE_150,
          child: Container(
            height: MainSizeData.SIZE_120,
            width: MainSizeData.SIZE_160,
            child: Column(
              children: [
                Text(
                  itemName,
                  style: TextStyle(
                      fontSize: MainSizeData.fontSize14,
                      fontWeight: FontWeight.bold,
                      color: MainColorData.black),
                ),
                SizedBox(height: MainSizeData.SIZE_5),
                Text(
                  itemCategory,
                  style: TextStyle(
                      fontSize: MainSizeData.fontSize10,
                      fontWeight: FontWeight.bold,
                      color: MainColorData.grey),
                ),
                Divider(
                    indent: MainSizeData.SIZE_14,
                    endIndent: MainSizeData.SIZE_14,
                    color: MainColorData.green_dop),
                ElevatedButton(
                  onPressed: onPressed,
                  child: Text(
                    'Konsultasi',
                    style: TextStyle(
                        fontSize: MainSizeData.SIZE_14,
                        fontWeight: FontWeight.w600,
                        color: MainColorData.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: MainColorData.green_dop,
                      padding: EdgeInsets.symmetric(
                          horizontal: MainSizeData.SIZE_18,
                          vertical: MainSizeData.SIZE_8),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(MainSizeData.SIZE_12))),
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}