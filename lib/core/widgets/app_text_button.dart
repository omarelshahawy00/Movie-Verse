import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/helpers/styles.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
    this.textStyle,
    this.buttonWidth,
    this.buttonHeight,
    this.backgroundColor,
    this.borderRadius,
    this.horizontalPadding,
    this.verticalPadding,
  });

  final VoidCallback onPressed;
  final String buttonText;
  final TextStyle? textStyle;
  final double? buttonWidth;
  final double? buttonHeight;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final double? horizontalPadding;
  final double? verticalPadding;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
          fixedSize:
              Size(buttonWidth?.w ?? double.maxFinite, buttonHeight?.h ?? 52.h),
          backgroundColor: backgroundColor ?? Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ??
                BorderRadius.circular(16), // Rounds the button corners
          ),
          padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding?.w ?? 12.w,
              vertical: verticalPadding?.h ?? 14.h),
        ),
        onPressed: onPressed,
        child: Center(
          child: Text(
            buttonText,
            style: textStyle ?? Styles.textStyle14,
          ),
        ));
  }
}
