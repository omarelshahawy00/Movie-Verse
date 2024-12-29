import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/constants/api_constants.dart';
import 'package:movie_app/core/helpers/routes.dart';
import 'package:movie_app/core/helpers/spaceing.dart';
import 'package:movie_app/core/theming/styles.dart';
import 'package:movie_app/core/widgets/custom_error.dart';
import 'package:movie_app/core/widgets/custom_loading_indecator.dart';
import 'package:movie_app/core/widgets/rating_item.dart';
import 'package:movie_app/core/widgets/custome_movie_item.dart';
import 'package:movie_app/features/actor_details/manager/actor_cubit/actor_cubit.dart';
import 'package:movie_app/features/actor_details/manager/actor_movies_cubit/actor_movies_cubit.dart';
import 'package:movie_app/features/actor_details/ui/widgets/actor_details_section.dart';

class ActorDetailsScreenBody extends StatelessWidget {
  const ActorDetailsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BlocBuilder<ActorCubit, ActorState>(
                        builder: (context, state) {
                          if (state is ActorSuccess) {
                            return ActorDetailsSection(actorModel: state.actor);
                          } else if (state is ActorFailure) {
                            return CustomError(errMessage: state.message);
                          } else {
                            return Column(
                              children: [
                                verticalSpace(50),
                                const CustomLoadingIndecator(),
                              ],
                            );
                          }
                        },
                      ),
                      verticalSpace(20),
                      Text('Actor Movies',
                          style: Styles.textStyle20
                              .copyWith(fontWeight: FontWeight.bold)),
                      verticalSpace(20),
                    ],
                  ),
                ),
              ),
              BlocBuilder<ActorMoviesCubit, ActorMoviesState>(
                builder: (context, state) {
                  if (state is ActorMoviesSuccess) {
                    return SliverPadding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      sliver: SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                          childCount: state.actorMovies.length,
                          (context, index) {
                            return GestureDetector(
                              onTap: () {
                                GoRouter.of(context).push(
                                    Routes.movieDetailsScreen,
                                    extra: state.actorMovies[index]);
                              },
                              child: CustomeMovieItem(
                                rating: RatingItem(
                                  count: state.actorMovies[index].voteCount!
                                      .toInt(),
                                  avg: double.parse(
                                    state.actorMovies[index].voteAverage!
                                        .toStringAsFixed(1),
                                  ),
                                ),
                                movieName: (state.actorMovies[index].title),
                                txtStyle: Styles.textStyle16
                                    .copyWith(fontWeight: FontWeight.bold),
                                imageUrl: state.actorMovies[index].posterPath !=
                                        null
                                    ? '${ApiConstants.baseImageUrl}${state.actorMovies[index].posterPath}'
                                    : 'https://files.oaiusercontent.com/file-LqhGwCxtVmTrTjuzQNfNBZ?se=2024-12-23T15%3A36%3A09Z&sp=r&sv=2024-08-04&sr=b&rscc=max-age%3D604800%2C%20immutable%2C%20private&rscd=attachment%3B%20filename%3D166e1004-c224-4d86-9972-945453b0c49a.webp&sig=jfAmSRXms8/qCGQxAR7ioxWobQSZdnaxyNhuqXH23zw%3D',
                              ),
                            );
                          },
                        ),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 15.w,
                          mainAxisSpacing: 15.h,
                          childAspectRatio: 0.7,
                        ),
                      ),
                    );
                  } else if (state is ActorMoviesFailure) {
                    return SliverToBoxAdapter(
                      child: CustomError(errMessage: state.message),
                    );
                  } else {
                    return SliverToBoxAdapter(
                      child: Column(
                        children: [
                          verticalSpace(80),
                          const CustomLoadingIndecator(),
                        ],
                      ),
                    );
                  }
                },
              )
            ],
          )),
    );
  }
}
