import 'package:flutter/material.dart';
import 'package:skala_mobile/main_commons/main_color_data.dart';
import 'package:skala_mobile/main_commons/main_size_data.dart';

class HeaderKonsultasiPraktisi extends StatelessWidget {
  const HeaderKonsultasiPraktisi({
    Key? key,
    required this.itemName,
    required this.itemKategori,
    this.itemSK,
    required this.itemImage,
    this.itemExperience,
    required this.size,
  }) : super(key: key);
  final String itemName;
  final String itemKategori;
  final String itemImage;
  final String? itemSK;
  final String? itemExperience;
  final Size size;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: MainSizeData.SIZE_10),
      height: size.height * 0.28 - 27,
      child: Stack(
        children: <Widget>[
          Container(
            height: size.height * 0.3 - 27,
            decoration: BoxDecoration(
              color: MainColorData.green_dop3,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36),
              ),
            ),
            child: Container(
              height: MainSizeData.SIZE_130,
              child: Stack(
                children: [
                  Positioned(
                    top: -4,
                    left: 26,
                    child: Card(
                      shadowColor: MainColorData.grey.withOpacity(0.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(15),
                            topRight: Radius.circular(15)),
                      ),
                      child: Container(
                        height: MainSizeData.SIZE_170,
                        width: MainSizeData.SIZE_140,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(15),
                              topRight: Radius.circular(15)),
                          image: DecorationImage(
                              image: AssetImage(
                                itemImage,
                              ),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: MainSizeData.SIZE_16,
                    left: MainSizeData.SIZE_170,
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
                                color: MainColorData.white),
                          ),
                          SizedBox(height: MainSizeData.SIZE_5),
                          Text(
                            itemKategori,
                            style: TextStyle(
                                fontSize: MainSizeData.fontSize12,
                                fontWeight: FontWeight.bold,
                                color: MainColorData.white),
                          ),
                          Divider(
                              indent: MainSizeData.SIZE_14,
                              endIndent: MainSizeData.SIZE_14,
                              color: MainColorData.white),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: MainSizeData.SIZE_14),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: MainSizeData.SIZE_5),
                                  child: Icon(
                                    Icons.timelapse,
                                    color: MainColorData.white,
                                    size: MainSizeData.SIZE_16,
                                  ),
                                ),
                                Text(
                                  "$itemExperience year experience",
                                  style: const TextStyle(
                                      color: MainColorData.white,
                                      fontSize: MainSizeData.SIZE_12,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MainSizeData.SIZE_12,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: MainSizeData.SIZE_14),
                            child: Text(
                              itemSK ?? '',
                              style: TextStyle(
                                  fontSize: MainSizeData.fontSize12,
                                  fontWeight: FontWeight.bold,
                                  color: MainColorData.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
