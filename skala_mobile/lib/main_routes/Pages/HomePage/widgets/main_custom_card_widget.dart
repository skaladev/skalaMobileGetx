import 'package:flutter/material.dart';
import 'package:skala_mobile/main_commons/main_color_data.dart';
import 'package:skala_mobile/main_commons/main_size_data.dart';
import 'package:skala_mobile/main_commons/main_text_data.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    required this.onPressed,
  }) : super(key: key);
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal:MainSizeData.SIZE_24,
      ),
      padding: EdgeInsets.symmetric(
        horizontal:MainSizeData.SIZE_16,
        vertical:MainSizeData.SIZE_14,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color:MainColorData.green_dop2,
        borderRadius: BorderRadius.circular(MainSizeData.SIZE_20),
      ),
      child: Column(
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: MainTextData.textDescription1,
                  style: TextStyle(
                    fontSize:MainSizeData.SIZE_12,
                    fontWeight: FontWeight.w400,
                    color:MainColorData.white,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.justify,
          ),
          SizedBox(height:MainSizeData.SIZE_10),
          ElevatedButton(
            onPressed: onPressed,
            child: Text(
              'Get Started',
              style: TextStyle(
                fontSize:MainSizeData.SIZE_14,
                fontWeight: FontWeight.w600,
                color:MainColorData.green_dop,
              ),
            ),
            style: ElevatedButton.styleFrom(
              primary:MainColorData.white,
              padding: EdgeInsets.symmetric(
                horizontal:MainSizeData.SIZE_14,
                vertical:MainSizeData.SIZE_8,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(MainSizeData.SIZE_12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
