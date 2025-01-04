import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/constants/api_constants.dart';
import 'package:movie_app/core/constants/color_manager.dart';
import 'package:movie_app/core/theming/styles.dart';
import 'package:movie_app/core/widgets/rating_item.dart';
import 'package:movie_app/features/favorites/data/hive_services.dart';
import 'package:movie_app/features/favorites/data/models/favorites_model.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';

class MainMovieItem extends StatelessWidget {
  const MainMovieItem({super.key, required this.movieModel});
  final MovieModel movieModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Movie Poster with Gradient
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color.fromARGB(255, 36, 36, 36).withValues(alpha: .91),
                  const Color.fromARGB(255, 36, 36, 36).withValues(alpha: 0),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.center,
                stops: const [0.4, 1.0],
              ),
            ),
            child: Hero(
              tag: movieModel.id!,
              child: CachedNetworkImage(
                placeholder: (context, url) => Center(
                  child: Image.asset('assets/images/loading2.gif'),
                ),
                imageUrl:
                    '${ApiConstants.baseImageUrl}${movieModel.posterPath ?? ''}',
                fit: BoxFit.fill,
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
        ),

        // Favorite Icon

        // Movie Title
        Positioned(
          bottom: 30.h,
          left: 7.5.w,
          right: 0,
          child: Container(
            margin: EdgeInsets.only(left: 7.5.w, right: 50.w),
            child: Text(
              movieModel.title ?? '',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style:
                  Styles.textStyle16.copyWith(overflow: TextOverflow.ellipsis),
            ),
          ),
        ),

        // Rating Item
        Positioned(
          bottom: 8.h,
          left: 15.w,
          right: 0,
          child: RatingItem(
            avg: double.parse(movieModel.voteAverage!.toStringAsFixed(1)),
            count: movieModel.voteCount!.toInt(),
          ),
        ),
      ],
    );
  }
}
