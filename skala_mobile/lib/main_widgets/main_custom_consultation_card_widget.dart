
import 'package:flutter/material.dart';
import 'package:skala_mobile/main_commons/main_color_data.dart';
import 'package:skala_mobile/main_commons/main_size_data.dart';

class MainConsultationCard extends StatelessWidget {
  const MainConsultationCard({
    Key? key,
    this.title,
    this.date,
    this.time,
    this.description,
    required this.onPressed,
  }) : super(key: key);
  final String? title;
  final String? date;
  final String? time;
  final String? description;
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
              horizontal: MainSizeData.SIZE_20, vertical: MainSizeData.SIZE_20),
          child: description == null ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
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
                  Container(
                    child: StatusSection(status: 'diterima') ,
                  )
                ],
              ),
              const SizedBox(
                height: MainSizeData.SIZE_8,
              ),
              Text(
                title!.toUpperCase(),
                style: const TextStyle(
                  color: MainColorData.black,
                  fontSize: MainSizeData.SIZE_14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ): Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
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
                  Container(
                    child: StatusSection(status: 'diterima') ,
                  )
                ],
              ),
              const SizedBox(
                height: MainSizeData.SIZE_8,
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
                description??"",
                style: TextStyle(
                  color: MainColorData.black,
                  fontSize: MainSizeData.SIZE_16,
                  height: 1.5
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class StatusSection extends StatelessWidget {
  const StatusSection({Key? key, required this.status}) : super(key: key);
  final String status;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: MainSizeData.SIZE_10, vertical: MainSizeData.SIZE_4),
      decoration: BoxDecoration(
          color: statusColor(),
          borderRadius: BorderRadius.circular(MainSizeData.SIZE_20)),
      child: Text(
        status,
        style: const TextStyle(
            color: MainColorData.white,
            fontSize: MainSizeData.SIZE_8,
            fontWeight: FontWeight.w900),
      ),
    );
  }

  Color? statusColor() {
    switch (status.toLowerCase()) {
      case 'diterima':
        return MainColorData.green;
      case 'ditolak':
        return MainColorData.redEF;
    }
  }
}
