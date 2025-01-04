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
                  : 'https://www.rockettstgeorge.co.uk/cdn/shop/products/no_selection_64feb3dc-4df2-4152-994f-fb44eac86064.jpg?v=1683648946',
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
