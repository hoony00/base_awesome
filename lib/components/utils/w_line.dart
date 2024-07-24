
import 'package:flutter/material.dart';

import '../../config/theme/colors/app_color.dart';


class Line extends StatelessWidget {
  final double thickness;
  final Color color;

  const Line({super.key, this.thickness = 0.5, this.color = AppColor.hintText});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color,
      thickness: thickness,
    );
  }
}
