import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/theming/app_styles.dart';
import 'package:movie_app/core/theming/colors.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    required this.hintText,
    this.focusedBorder,
    this.enabledBorder,
    this.borderRadius,
    this.borderSide,
    this.hintTextStyle,
    this.contentPadding,
    this.isObscureText,
    this.backgroundColor,
    this.suffixIcon,
    this.fillColor,
    this.backgroundColorFocused,
    this.onChanged,
  });

  final String hintText;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final BorderRadius? borderRadius;
  final BorderSide? borderSide;
  final TextStyle? hintTextStyle;
  final EdgeInsetsGeometry? contentPadding;
  final bool? isObscureText;
  final Color? backgroundColor;
  final Color? backgroundColorFocused;
  final Widget? suffixIcon;
  final Color? fillColor;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      obscureText: isObscureText ?? false,
      decoration: InputDecoration(
        isDense: true,
        hintText: hintText,
        hintStyle: hintTextStyle ?? TextStyles.font14LightGrayRegular,
        fillColor: fillColor ?? ColorsManager.moreLightGray,
        filled: true,
        suffixIcon: suffixIcon,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(
                color: backgroundColorFocused ?? ColorsManager.mainBlue,
                width: 1.3,
              ),
              borderRadius: borderRadius ?? BorderRadius.circular(16),
            ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(
                color: backgroundColor ?? ColorsManager.lightGray,
                width: 1.3,
              ),
              borderRadius: borderRadius ?? BorderRadius.circular(16),
            ),
      ),
    );
  }
}
