import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:movie_app/core/constants/api_constants.dart';
import 'package:movie_app/core/constants/color_manager.dart';
import 'package:movie_app/core/helpers/routes.dart';
import 'package:movie_app/core/theming/styles.dart';
import 'package:movie_app/core/widgets/rating_item.dart';
import 'package:movie_app/core/widgets/custome_movie_item.dart';
import 'package:movie_app/features/favorites/data/hive_services.dart';
import 'package:movie_app/features/favorites/data/models/favorites_model_extension.dart';
import 'package:movie_app/features/favorites/manager/favorites_cubit/favorites_cubit.dart';

class FavoritesScreenBody extends StatelessWidget {
  const FavoritesScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            children: [
              const Text('Clear All', style: Styles.textStyle16),
              IconButton(
                onPressed: () {
                  HiveServices.clearAllItems().then(
                    (value) {
                      if (context.mounted) {
                        BlocProvider.of<FavoritesCubit>(context).getFavorites();
                      }
                    },
                  );
                },
                icon: const Icon(
                  Icons.delete_forever,
                  size: 35,
                  color: ColorManager.primaryColor,
                ),
              ),
            ],
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Favorites'),
        titleTextStyle: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: BlocBuilder<FavoritesCubit, FavoritesState>(
              builder: (context, state) {
                if (state is FavoritesSuccess) {
                  if (state.favorites.isEmpty) {
                    return const Center(
                      child: Text(
                        'No favorites found.',
                        style: Styles.textStyle20,
                      ),
                    );
                  }
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.7,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: state.favorites.length,
                      itemBuilder: (context, index) {
                        final favorite = state.favorites[index];
                        return GestureDetector(
                          onTap: () {
                            // GoRouter.of(context)
                            //     .push(Routes.movieDetailsScreen,
                            //         extra: favorite.toMovieModel())
                            GoRouter.of(context)
                                .push(Routes.movieDetailsScreen,
                                    extra: favorite)
                                .then(
                              (value) {
                                if (context.mounted) {
                                  BlocProvider.of<FavoritesCubit>(context)
                                      .getFavorites();
                                }
                              },
                            );
                          },
                          child: CustomeMovieItem(
                            rating: RatingItem(
                              count: favorite.voteCount!.toInt(),
                              avg: double.parse(
                                favorite.voteAverage!.toStringAsFixed(1),
                              ),
                            ),
                            movieName: favorite.title,
                            txtStyle: Styles.textStyle16.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                            imageUrl: favorite.posterPath != null
                                ? '${ApiConstants.baseImageUrl}${favorite.posterPath}'
                                : 'https://www.rockettstgeorge.co.uk/cdn/shop/products/no_selection_64feb3dc-4df2-4152-994f-fb44eac86064.jpg?v=1683648946',
                            icon: GestureDetector(
                              onTap: () {
                                HiveServices.deleteItem(
                                  favorite.id!,
                                );
                                BlocProvider.of<FavoritesCubit>(context)
                                    .getFavorites();
                              },
                              child: const Icon(
                                Icons.delete,
                                size: 35,
                                color: ColorManager.primaryColor,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                } else if (state is FavoritesFailure) {
                  return Center(
                    child: Text(state.errMessage),
                  );
                } else {
                  return const Center(
                    child: Text(''),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
