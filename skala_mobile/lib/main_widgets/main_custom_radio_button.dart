import 'package:flutter/material.dart';
import 'package:skala_mobile/main_commons/main_color_data.dart';
import 'package:skala_mobile/main_commons/main_size_data.dart';

class MainCustomRadioButtom extends StatefulWidget {
  const MainCustomRadioButtom(
      {Key? key, this.label, this.margin, required this.groupValue,this.onChanged})
      : super(key: key);
  final String? label;
  final EdgeInsets? margin;
  final String groupValue;
  final void Function(String? value)? onChanged;

  @override
  State<MainCustomRadioButtom> createState() => _MainCustomRadioButtomState();
}

class _MainCustomRadioButtomState extends State<MainCustomRadioButtom> {
  String? gender;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: widget.margin,
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
                value: "M",
                groupValue: widget.groupValue,
                onChanged:widget.onChanged,
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
                value: "F",
                groupValue: widget.groupValue,
                onChanged: widget.onChanged,
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
