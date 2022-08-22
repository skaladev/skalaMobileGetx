import 'package:flutter/material.dart';
import 'package:skala_mobile/main_commons/main_color_data.dart';
import 'package:skala_mobile/main_commons/main_size_data.dart';

class MainConsultationCardPraktisi extends StatelessWidget {
  const MainConsultationCardPraktisi({
    Key? key,
    this.title,
    this.date,
    this.time,
    this.status,
    this.kategori,
    this.fromUser,
    this.profession,
    required this.onPressed,
  }) : super(key: key);

  final String? title;
  final String? date;
  final String? time;
  final String? status;
  final String? kategori;
  final String? fromUser;
  final String? profession;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
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
              horizontal: MainSizeData.SIZE_20, vertical: MainSizeData.SIZE_16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    date ?? "-",
                    style: const TextStyle(
                        color: MainColorData.black,
                        fontSize: MainSizeData.SIZE_12,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    width: MainSizeData.SIZE_8,
                  ),
                  Text(
                    time ?? "-",
                    style: const TextStyle(
                        color: MainColorData.black,
                        fontSize: MainSizeData.SIZE_12,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    width: MainSizeData.SIZE_10,
                  ),
                  // Container(
                  //   child: Text(
                  //     'Menunggu',
                  //     style: const TextStyle(
                  //         color: MainColorData.yellowFF,
                  //         fontSize: MainSizeData.SIZE_12,
                  //         fontWeight: FontWeight.w500),
                  //   ),
                  // ),
                  const SizedBox(
                    width: MainSizeData.SIZE_12,
                  ),
                  Text(
                    kategori ?? "-",
                    style: const TextStyle(
                      color: MainColorData.black,
                      fontSize: MainSizeData.SIZE_12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: MainSizeData.SIZE_10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Dari : ${fromUser ?? '-'}",
                    style: const TextStyle(
                        color: MainColorData.black,
                        fontSize: MainSizeData.SIZE_12,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: MainSizeData.SIZE_6,
                  ),
                  Text(
                    "Pekerjaan : ${profession ?? '-'}",
                    style: const TextStyle(
                        color: MainColorData.black,
                        fontSize: MainSizeData.SIZE_12,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(
                height: MainSizeData.SIZE_6,
              ),
              Text(
                title?.toUpperCase() ?? "-",
                style: const TextStyle(
                  color: MainColorData.black,
                  fontSize: MainSizeData.SIZE_14,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
