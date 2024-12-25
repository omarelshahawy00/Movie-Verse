import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/constants/api_constants.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';
import 'package:movie_app/features/search/data/models/search_model.dart';

class BackgroundImgWithPlayIcon extends StatelessWidget {
  const BackgroundImgWithPlayIcon({super.key, required this.movie});
  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 0,
          top: 0,
          bottom: 0,
          right: 0,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30.r),
              bottomRight: Radius.circular(30.r),
            ),
            child: CachedNetworkImage(
              imageUrl: '${ApiConstants.baseImageUrl}${movie.posterPath}',
              filterQuality: FilterQuality.high,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
          child: Center(
            child: Icon(
              Icons.play_circle_outlined,
              size: 80,
              color: const Color.fromARGB(255, 241, 239, 239).withOpacity(.8),
            ),
          ),
        ),
      ],
    );
  }
}
