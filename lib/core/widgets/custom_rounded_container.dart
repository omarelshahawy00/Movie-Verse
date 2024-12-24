import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRoundedContainer extends StatelessWidget {
  const CustomRoundedContainer(
      {super.key,
      required this.insideTitle,
      this.borderWidth,
      this.boarderColor,
      this.borderRadius});

  final String insideTitle;
  final double? borderWidth;
  final Color? boarderColor;
  final BorderRadiusGeometry? borderRadius;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(20.r),
        border: Border.all(
          width: borderWidth ?? 1.5.w,
          color: boarderColor ?? const Color.fromARGB(255, 146, 146, 146),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(insideTitle),
      ),
    );
  }
}
