import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/constants/api_constants.dart';

class TopMovieItem extends StatelessWidget {
  const TopMovieItem({super.key, required this.urlImage});
  final String urlImage;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        width: 350.w,
        child: CachedNetworkImage(
          placeholder: (context, url) => Center(
            child: Image.asset(
              'assets/images/loading2.gif',
            ),
          ),
          imageUrl: '${ApiConstants.baseImageUrl}$urlImage',
          fit: BoxFit.fill,
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
