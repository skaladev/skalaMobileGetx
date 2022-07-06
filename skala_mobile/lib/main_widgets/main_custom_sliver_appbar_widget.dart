
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:skala_mobile/main_commons/main_color_data.dart';
import 'package:skala_mobile/main_commons/main_size_data.dart';

class MainCustomSliverAppbarWidget extends StatelessWidget {
  final bool? pinned;
  final bool? stretch;
  final double ? expandedHeight;
  final Color? backgroundColor;
  final String? image;

  const MainCustomSliverAppbarWidget({Key? key,
    this.pinned,
    this.stretch,
    this.expandedHeight,
    this.backgroundColor,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
          pinned: pinned ?? true,
          stretch: stretch ?? true,
          expandedHeight: expandedHeight ?? MainSizeData.SIZE_260,
          backgroundColor: backgroundColor,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.asset(
             image!,
              width: double.maxFinite,
              fit: BoxFit.cover,
            ),
            stretchModes: <StretchMode>[
              StretchMode.zoomBackground,
              StretchMode.blurBackground,
            ],
          ),
        ),
        ],
      ),
    );
  }
}