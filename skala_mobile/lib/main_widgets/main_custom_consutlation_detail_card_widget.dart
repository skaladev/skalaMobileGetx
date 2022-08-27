import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:skala_mobile/main_commons/main_color_data.dart';
import 'package:skala_mobile/main_commons/main_size_data.dart';

class MainCustomConsultationDetailCardWidget extends StatelessWidget {
  const MainCustomConsultationDetailCardWidget(
      {Key? key,
      this.title,
      this.date,
      this.time,
      this.description,
      this.label,
      this.image_path,
      this.from_user})
      : super(key: key);
  final String? title;
  final String? date;
  final String? time;
  final String? description;
  final String? label;
  final String? from_user;
  final NetworkImage? image_path;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: Card(
          margin: const EdgeInsets.symmetric(
              horizontal: MainSizeData.SIZE_20, vertical: MainSizeData.SIZE_5),
          elevation: 0,
          color: MainColorData.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(MainSizeData.SIZE_8),
            side: const BorderSide(
              color: MainColorData.grey,
              width: MainSizeData.SIZE_1,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: MainSizeData.SIZE_20,
                vertical: MainSizeData.SIZE_10),
            child: description == null
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Text(
                                  date ?? '',
                                  style: const TextStyle(
                                      color: MainColorData.grey,
                                      fontSize: MainSizeData.SIZE_10,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  width: MainSizeData.SIZE_8,
                                ),
                                Text(
                                  time ?? '',
                                  style: const TextStyle(
                                      color: MainColorData.grey,
                                      fontSize: MainSizeData.SIZE_10,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  width: MainSizeData.SIZE_20,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "Oleh  : $from_user",
                        style: const TextStyle(
                          color: MainColorData.black,
                          fontSize: MainSizeData.SIZE_14,
                          height: 1.5,
                        ),
                      ),
                      SizedBox(
                        height: MainSizeData.SIZE_10,
                      ),
                      Text(
                        title!.toUpperCase(),
                        style: const TextStyle(
                          color: MainColorData.black,
                          fontSize: MainSizeData.SIZE_14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: MainSizeData.SIZE_10,
                      ),
                      Text(
                        label!.toLowerCase(),
                        style: const TextStyle(
                          color: MainColorData.grey,
                          fontSize: MainSizeData.SIZE_14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        Text(
                          date ?? '',
                          style: const TextStyle(
                              color: MainColorData.grey,
                              fontSize: MainSizeData.SIZE_10,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          width: MainSizeData.SIZE_8,
                        ),
                        Text(
                          time ?? '',
                          style: const TextStyle(
                              color: MainColorData.grey,
                              fontSize: MainSizeData.SIZE_10,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          width: MainSizeData.SIZE_20,
                        )
                      ]),
                      const SizedBox(
                        height: MainSizeData.SIZE_8,
                      ),
                      Text(
                        "Oleh  : $from_user",
                        style: const TextStyle(
                          color: MainColorData.black,
                          fontSize: MainSizeData.SIZE_14,
                          height: 1.5,
                        ),
                      ),
                      SizedBox(
                        height: MainSizeData.SIZE_10,
                      ),
                      Text(
                        title!.toUpperCase(),
                        style: const TextStyle(
                          color: MainColorData.black,
                          fontSize: MainSizeData.SIZE_14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        description ?? "",
                        style: TextStyle(
                            color: MainColorData.black,
                            fontSize: MainSizeData.SIZE_16,
                            height: 1.5),
                      )
                    ],
                  ),
          ),
        ));
  }
}
