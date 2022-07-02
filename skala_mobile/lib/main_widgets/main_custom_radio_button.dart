

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_utils/src/platform/platform_web.dart';
import 'package:skala_mobile/main_commons/main_color_data.dart';
import 'package:skala_mobile/main_commons/main_size_data.dart';

class MainCustomRadioButtom extends StatefulWidget {
  const MainCustomRadioButtom({Key? key, this.label}) : super(key: key);
  final String?label;

  @override
  State<MainCustomRadioButtom> createState() => _MainCustomRadioButtomState();
}

class _MainCustomRadioButtomState extends State<MainCustomRadioButtom> {
  String? gender;
  @override
  Widget build(BuildContext context) {
      Size size = MediaQuery.of(context).size;
      return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label ?? '',
            style: const TextStyle(
                color: MainColorData.grey,
                fontSize: MainSizeData.SIZE_12,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: MainSizeData.SIZE_8,
          ),
          Row(
            children: [
              Radio<String>(
                value: "Laki-laki",
                groupValue: gender,
                onChanged: (value) {
                  setState(() {
                    gender = value;
                  });
                },
              ),
              Text(
                'Laki-laki',
                style: const TextStyle(
                    color: MainColorData.grey,
                    fontSize: MainSizeData.SIZE_12,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                width: MainSizeData.SIZE_8,
              ),
              Radio<String>(
                value: "Perempuan",
                groupValue: gender,
                onChanged: (value) {
                  setState(() {
                    gender = value;
                  });
                },
              ),
              Text(
                'Perempuan',
                style: const TextStyle(
                    color: MainColorData.grey,
                    fontSize: MainSizeData.SIZE_12,
                    fontWeight: FontWeight.w500),
              ),
            ],
          )
        ],
      ),
    );
  }
}