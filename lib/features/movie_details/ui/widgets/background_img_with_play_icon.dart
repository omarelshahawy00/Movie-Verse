import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/constants/api_constants.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';

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
              imageUrl: movie.posterPath != null
                  ? '${ApiConstants.baseImageUrl}${movie.posterPath}'
                  : 'https://files.oaiusercontent.com/file-JbmUC7TQ2ysncKUQPoxQvG?se=2024-12-25T14%3A53%3A05Z&sp=r&sv=2024-08-04&sr=b&rscc=max-age%3D604800%2C%20immutable%2C%20private&rscd=attachment%3B%20filename%3Dcf96d8c5-c6bf-458c-bb1e-b4b15fac0f27.webp&sig=sm3etU6wlEwNVUB7bzAv994gVKj14MRaWCoKDKJRJD0%3D',
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
