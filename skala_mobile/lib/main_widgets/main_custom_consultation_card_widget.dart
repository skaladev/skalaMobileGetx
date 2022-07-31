
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
    this.onDelete,
    this.status,
    this.label,
    required this.onPressed,
  }) : super(key: key);
  final String? title;
  final String? date;
  final String? time;
  final String? description;
  final String? status;
  final String? label;
  final Function onPressed;
  final Function? onDelete;
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
              horizontal: MainSizeData.SIZE_20, vertical: MainSizeData.SIZE_10),
          child: description == null ? Column(
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
                        Container(
                          child: StatusSection(status: status == 'Answered' ? 'Terkirim' : 'Dibalas') ,
                        ),
                      ],
                    ),
                  ),
                  if(onDelete !=null)
                    IconButton(
                      icon: const Icon(Icons.delete),
                      color: Colors.red,
                      onPressed: ()=>onDelete!()
                    )
                ],
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
                    child: StatusSection(status: status == "Unaswered" ? 'Dibalas' : 'Dibalas') ,
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
    switch (status) {
      case 'Terkirim':
        return MainColorData.green;
      case 'Dibalas':
        return MainColorData.redEF;
    }
  }
}
