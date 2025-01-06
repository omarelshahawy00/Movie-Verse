import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/helpers/routes.dart';
import 'package:movie_app/core/helpers/spaceing.dart';
import 'package:movie_app/core/widgets/custom_loading_indecator.dart';
import 'package:movie_app/features/home/manager/all_movies_cubit/all_movies_cubit.dart';
import 'package:movie_app/features/home/manager/category_cubit/category_cubit.dart';
import 'package:movie_app/features/home/ui/widgets/main_movie_item.dart';

class MoviesGridView extends StatelessWidget {
  const MoviesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllMoviesCubit, AllMoviesState>(
      builder: (context, state) {
        if (state is AllMoviesSuccess) {
          return SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) => GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(Routes.movieDetailsScreen,
                        extra: (state.movie[index]));
                  },
                  child: MainMovieItem(
                    movieModel: state.movie[index],
                  ),
                ),
                childCount: state.movie.length,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 0.7,
              ),
            ),
          );
        } else if (state is AllMoviesFailure) {
          return SliverToBoxAdapter(
            child: Center(child: Text(state.errMessage)),
          );
        } else {
          return SliverToBoxAdapter(
            child: Column(
              children: [
                verticalSpace(100),
                const CustomLoadingIndecator(),
              ],
            ),
          );
        }
      },
    );
  }
}
