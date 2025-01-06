import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/constants/color_manager.dart';
import 'package:movie_app/core/helpers/spaceing.dart';
import 'package:movie_app/core/theming/styles.dart';
import 'package:movie_app/core/widgets/custom_rounded_container.dart';
import 'package:movie_app/core/widgets/rating_item.dart';
import 'package:movie_app/features/favorites/data/hive_services.dart';
import 'package:movie_app/features/favorites/data/models/favorites_model.dart';
import 'package:movie_app/features/favorites/manager/add_to_favorites_cubit/add_to_favorites_cubit.dart';
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
                Column(
                  children: [
                    BlocBuilder<AddToFavoritesCubit, AddToFavoritesState>(
                      builder: (context, state) {
                        bool isFav = HiveServices.getItems()
                            .any((item) => item.id == movie.id);

                        return GestureDetector(
                          onTap: () {
                            if (isFav) {
                              BlocProvider.of<AddToFavoritesCubit>(context)
                                  .removeItemFromHive(movie.id!);
                            } else {
                              BlocProvider.of<AddToFavoritesCubit>(context)
                                  .addDataToHive(
                                FavoritesModel(
                                  posterPath: movie.posterPath ?? '',
                                  title: movie.title ?? '',
                                  id: movie.id ?? 0,
                                  voteAverage: movie.voteAverage ?? 0.0,
                                  voteCount: movie.voteCount ?? 0,
                                  releaseDate: movie.releaseDate ?? 'Unknown',
                                  overview:
                                      movie.overview ?? 'No overview available',
                                  mainLanguage:
                                      movie.originalLanguage ?? 'Unknown',
                                ),
                              );
                            }
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(isFav
                                    ? 'Removed from favorites!'
                                    : 'Added to favorites!'),
                                duration: const Duration(seconds: 2),
                              ),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 60.w),
                            child: GestureDetector(
                              child: Icon(
                                isFav ? Icons.favorite : Icons.favorite_border,
                                size: 35,
                                color: ColorManager.primaryColor,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    verticalSpace(20),
                    RatingItem(
                      count: movie.voteCount!.toInt(),
                      avg: double.parse(movie.voteAverage!.toStringAsFixed(1)),
                    ),
                  ],
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
