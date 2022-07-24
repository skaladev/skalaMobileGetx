import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skala_mobile/main_commons/main_color_data.dart';

class ConfirmDialogWidget extends StatelessWidget {
  const ConfirmDialogWidget({
    Key? key,
    required this.title,
    this.okWidget,
    this.cancelWidget,
  }) : super(key: key);

  final String title;
  final Widget? okWidget;
  final Widget? cancelWidget;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Center(child: Text(title)),
      contentPadding: const EdgeInsets.all(16),
      children: [
        Row(
          children: [
            Expanded(
              child: cancelWidget ??
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        MainColorData.grey,
                      ),
                    ),
                    onPressed: () {
                      Get.back(result: false);
                    },
                    child: const Text('Cancel'),
                  ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: okWidget ??
                  ElevatedButton(
                     style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        MainColorData.green_dop,
                      ),
                    ),
                    onPressed: () {
                      Get.back(result: true);
                    },
                    child: const Text('Continue'),
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
