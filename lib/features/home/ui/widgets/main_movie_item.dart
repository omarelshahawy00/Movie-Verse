import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/constants/api_constants.dart';
import 'package:movie_app/core/helpers/styles.dart';
import 'package:movie_app/core/widgets/rating_item.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';

class MainMovieItem extends StatelessWidget {
  const MainMovieItem({super.key, required this.movieModel});
  final MovieModel movieModel;

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
                child: Image.asset(
                  'assets/images/loading2.gif',
                ),
              ),
              imageUrl: '${ApiConstants.baseImageUrl}${movieModel.posterPath}',
              fit: BoxFit.fill,
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
        Positioned(
          bottom: 30.h,
          left: 15.w,
          right: 0,
          child: Text(
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            movieModel.title ?? '',
            style: Styles.textStyle16,
          ),
        ),
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
