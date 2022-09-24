import 'package:flutter/material.dart';
import 'package:skala_mobile/main_commons/main_color_data.dart';
import 'package:skala_mobile/main_commons/main_size_data.dart';

class MainNotificationCard extends StatelessWidget {
  const MainNotificationCard(
      {Key? key, this.date, this.time, this.title, this.message})
      : super(key: key);
  final String? title;
  final String? message;
  final String? time;
  final String? date;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
          horizontal: MainSizeData.SIZE_20, vertical: MainSizeData.SIZE_6),
      elevation: 0,
      color: MainColorData.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(MainSizeData.SIZE_16),
          side: const BorderSide(color: MainColorData.green_dop)),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: MainSizeData.SIZE_10, vertical: MainSizeData.SIZE_10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  date.toString(),
                  style: const TextStyle(
                    color: MainColorData.grey,
                    fontSize: MainSizeData.SIZE_10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: MainSizeData.SIZE_8),
                Text(
                  time ?? '',
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
            Text(
              message ?? '',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: const TextStyle(
                  color: MainColorData.grey,
                  fontSize: MainSizeData.SIZE_12,
                  fontWeight: FontWeight.w400),
            )
            // Row(
            //   children: [
            //     const Icon(
            //       Icons.done_sharp,
            //       color: MainColorData.green,
            //     ),

            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
