import 'package:flutter/material.dart';
import 'package:movie_app/core/helpers/spaceing.dart';
import 'package:movie_app/core/theming/styles.dart';
import 'package:movie_app/core/widgets/custom_rounded_container.dart';
import 'package:movie_app/core/widgets/rating_item.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';

class DetailsSection extends StatelessWidget {
  const DetailsSection({super.key, required this.movie});
  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomRoundedContainer(
                      insideTitle: 'Release Date : ${movie.releaseDate}',
                    ),
                    verticalSpace(10),
                    CustomRoundedContainer(
                      insideTitle:
                          'Main Language : ${movie.originalLanguage!.toUpperCase()}',
                    )
                  ],
                ),
                horizontalSpace(20),
                RatingItem(
                  count: movie.voteCount!.toInt(),
                  avg: double.parse(movie.voteAverage!.toStringAsFixed(1)),
                ),
              ],
            ),
          ),
          verticalSpace(20),
          Text(
            'Overview',
            style: Styles.textStyle20.copyWith(fontWeight: FontWeight.bold),
          ),
          verticalSpace(10),
          Text(
            '${movie.overview}',
            style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w400),
          ),
          verticalSpace(20),
        ],
      ),
    );
  }
}
