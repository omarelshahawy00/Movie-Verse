import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/constants/api_constants.dart';
import 'package:movie_app/core/constants/color_manager.dart';
import 'package:movie_app/core/helpers/routes.dart';
import 'package:movie_app/core/theming/styles.dart';
import 'package:movie_app/core/widgets/rating_item.dart';
import 'package:movie_app/core/widgets/custome_movie_item.dart';
import 'package:movie_app/features/favorites/data/hive_services.dart';
import 'package:movie_app/features/favorites/data/models/favorites_model_extension.dart';
import 'package:movie_app/features/favorites/manager/cubit/favorites_cubit.dart';

class FavoritesScreenBody extends StatefulWidget {
  const FavoritesScreenBody({super.key});

  @override
  State<FavoritesScreenBody> createState() => _FavoritesScreenBodyState();
}

class _FavoritesScreenBodyState extends State<FavoritesScreenBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                    child: GridView(
                      physics: const BouncingScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.7,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      shrinkWrap: true,
                      children: List.generate(state.favorites.length, (index) {
                        final favorite = state.favorites[index];
                        return GestureDetector(
                          onTap: () {
                            GoRouter.of(context).push(
                              Routes.movieDetailsScreen,
                              extra: favorite.toMovieModel(),
                            );
                          },
                          child: CustomeMovieItem(
                            rating: RatingItem(
                              count: state.favorites[index].voteCount!.toInt(),
                              avg: double.parse(
                                state.favorites[index].voteAverage!
                                    .toStringAsFixed(1),
                              ),
                            ),
                            movieName: (state.favorites[index].title),
                            txtStyle: Styles.textStyle16
                                .copyWith(fontWeight: FontWeight.bold),
                            imageUrl: state.favorites[index].posterPath != null
                                ? '${ApiConstants.baseImageUrl}${state.favorites[index].posterPath}'
                                : 'https://files.oaiusercontent.com/file-LqhGwCxtVmTrTjuzQNfNBZ?se=2024-12-23T15%3A36%3A09Z&sp=r&sv=2024-08-04&sr=b&rscc=max-age%3D604800%2C%20immutable%2C%20private&rscd=attachment%3B%20filename%3D166e1004-c224-4d86-9972-945453b0c49a.webp&sig=jfAmSRXms8/qCGQxAR7ioxWobQSZdnaxyNhuqXH23zw%3D',
                            icon: GestureDetector(
                              onTap: () {
                                HiveServices.deleteItem(
                                  state.favorites[index].id!,
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
                      }),
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
