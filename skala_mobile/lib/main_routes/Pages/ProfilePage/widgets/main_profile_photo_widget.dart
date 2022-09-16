import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skala_mobile/main_commons/main_color_data.dart';

class MainProfilePhotoWidget extends StatelessWidget {
  const MainProfilePhotoWidget({Key? key, required this.size})
      : super(key: key);
  final Size size;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: size.height * 0.1,
        width: size.width * 0.2,
        child: Stack(fit: StackFit.expand, children: [
          CircleAvatar(
            backgroundColor: MainColorData.green_dop,
            // backgroundImage: AssetImage('assets/images/logo.png'),
          ),
          // Positioned(
          //   right: -6,
          //   bottom: 0,
          //   child: SizedBox(
          //     height: 30,
          //     width: 30,
          //     child: FlatButton(
          //         padding: EdgeInsets.zero,
          //         shape: RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(50),
          //             side: BorderSide(color: MainColorData.white)),
          //         color: Color(0xFFF5F6F9),
          //         onPressed: () {},
          //         child: SizedBox(
          //           height: 18,
          //           width: 18,
          //           child: SvgPicture.asset(
          //             'assets/icons/ic_camera.svg',
          //           ),
          //         )),
          //   ),
          // )
        ]));
  }
}
