import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/constants/api_constants.dart';
import 'package:movie_app/core/helpers/routes.dart';
import 'package:movie_app/core/theming/styles.dart';
import 'package:movie_app/core/widgets/app_text_form_field.dart';
import 'package:movie_app/core/widgets/rating_item.dart';
import 'package:movie_app/core/widgets/custome_movie_item.dart';

import 'package:movie_app/features/search/manager/cubit/search_cubit.dart';

class SearchScreenBody extends StatelessWidget {
  const SearchScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              AppTextFormField(
                onChanged: (char) {
                  BlocProvider.of<SearchCubit>(context).searchMovies(char);
                },
                fillColor: Colors.transparent,
                hintText: 'Search',
                suffixIcon: const Icon(
                  Icons.search,
                  size: 30,
                  color: Color.fromARGB(255, 168, 168, 168),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: BlocBuilder<SearchCubit, SearchState>(
                  builder: (context, state) {
                    if (state is SearchSuccess) {
                      return GridView(
                        physics: const BouncingScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.7,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        shrinkWrap: true,
                        children: List.generate(state.movies.length, (index) {
                          return GestureDetector(
                            onTap: () {
                              GoRouter.of(context).push(
                                Routes.movieDetailsScreen,
                                extra: state.movies[index],
                              );
                            },
                            child: CustomeMovieItem(
                              rating: RatingItem(
                                count: state.movies[index].voteCount!.toInt(),
                                avg: double.parse(
                                  state.movies[index].voteAverage!
                                      .toStringAsFixed(1),
                                ),
                              ),
                              movieName: (state.movies[index].title),
                              txtStyle: Styles.textStyle16
                                  .copyWith(fontWeight: FontWeight.bold),
                              imageUrl: state.movies[index].posterPath != null
                                  ? '${ApiConstants.baseImageUrl}${state.movies[index].posterPath}'
                                  : 'https://www.rockettstgeorge.co.uk/cdn/shop/products/no_selection_64feb3dc-4df2-4152-994f-fb44eac86064.jpg?v=1683648946',
                            ),
                          );
                        }),
                      );
                    } else if (state is SearchFailure) {
                      return Center(
                        child: Text(state.message),
                      );
                    } else if (state is SearchLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return const Center(
                        child: Text(
                          'Enter a movie name to search',
                          style: Styles.textStyle20,
                        ),
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
