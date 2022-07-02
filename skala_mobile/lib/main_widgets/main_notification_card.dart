

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:skala_mobile/main_commons/main_color_data.dart';
import 'package:skala_mobile/main_commons/main_size_data.dart';

class MainNotificationCard extends StatelessWidget {
  const MainNotificationCard({
    Key? key,
    this.title,
    this.message
    }) : super(key: key);
    final String? title;
    final String? message;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: MainSizeData.SIZE_20, vertical: MainSizeData.SIZE_20),
      elevation: 0,
      color: MainColorData.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(MainSizeData.SIZE_8),
        side: const BorderSide(
          color: MainColorData.green_dop,
          width: MainSizeData.SIZE_2
        )
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: MainSizeData.SIZE_10,vertical: MainSizeData.SIZE_10),
        child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '22 Januari 2020',
                      style: const TextStyle(
                        color: MainColorData.grey,
                        fontSize: MainSizeData.SIZE_10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: MainSizeData.SIZE_8),
                    Text(
                      '12:00',
                      style: const TextStyle(
                        color: MainColorData.grey,
                        fontSize: MainSizeData.SIZE_10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: MainSizeData.SIZE_8),
                Text(
                  title ?? '',
                  style: const TextStyle(
                    color: MainColorData.black,
                    fontSize: MainSizeData.SIZE_16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: MainSizeData.SIZE_8),
                Row(
                  children: [
                    Icon(
                      Icons.done_sharp,
                      color: MainColorData.green,
                    ),
                    Text(
                      message ?? '',
                      style: const TextStyle(
                          color: MainColorData.grey,
                          fontSize: MainSizeData.SIZE_12,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ],
            ),
      ) ,
    );
  }
}