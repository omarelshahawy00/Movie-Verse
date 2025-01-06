import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/constants/assets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key,
      this.title,
      this.logo,
      this.icon,
      required this.onPressed,
      this.mainAxisAlignment});
  final String? title;
  final String? logo;
  final Icon? icon;
  final void Function() onPressed;
  final MainAxisAlignment? mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
      children: [
        Image.asset(
          logo ?? AssetsData.logo2,
          width: 60.w,
        ),
        Text(
          title ?? ' ',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
