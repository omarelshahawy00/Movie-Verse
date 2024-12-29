import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomeMovieItem extends StatelessWidget {
  const CustomeMovieItem({
    super.key,
    required this.imageUrl,
    this.placeHolder,
    this.movieName,
    this.rating,
    this.txtStyle,
    this.icon,
  });
  final String imageUrl;
  final Widget? placeHolder;
  final String? movieName;
  final Widget? rating;
  final TextStyle? txtStyle;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    const Color.fromARGB(255, 36, 36, 36).withOpacity(.85),
                    const Color.fromARGB(255, 36, 36, 36).withAlpha(0),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                  stops: [.4.h, 1.h]),
            ),
            child: CachedNetworkImage(
              placeholder: (context, url) => Center(
                child: placeHolder ??
                    Image.asset(
                      'assets/images/loading2.gif',
                    ),
              ),
              imageUrl: imageUrl,
              fit: BoxFit.fill,
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
        Positioned(
          left: 110.w,
          top: 180.h,
          child: icon ?? Container(),
        ),
        Positioned(
          bottom: 30.h,
          left: 7.5.w,
          right: 0,
          child: Container(
            margin: EdgeInsets.only(left: 7.5.w, right: 50.w),
            child: Text(
              maxLines: 2,
              movieName ?? '',
              style: txtStyle?.copyWith(overflow: TextOverflow.ellipsis),
            ),
          ),
        ),
        Positioned(
          bottom: 8.h,
          left: 15.w,
          right: 0,
          child: rating ?? const Text('0'),
        ),
      ],
    );
  }
}
