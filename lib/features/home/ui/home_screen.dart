import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/helpers/get_it.dart';
import 'package:movie_app/features/home/data/repos/home_repo_impl.dart';
import 'package:movie_app/features/home/manager/all_movies_cubit/all_movies_cubit.dart';
import 'package:movie_app/features/home/manager/category_cubit/category_cubit.dart';
import 'package:movie_app/features/home/manager/trending_movies_cubit/trending_movie_cubit.dart';
import 'package:movie_app/features/home/ui/widgets/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => TrendingMovieCubit(getIt.get<HomeRepoImpl>())
                ..fetchTrendingMovies(),
            ),
            BlocProvider(
              create: (context) =>
                  AllMoviesCubit(getIt.get<HomeRepoImpl>())..fetchMovies(null),
            ),
            BlocProvider(create: (context) => CategoryCubit()),
          ],
          child: HomeScreenBody(),
        ),
      ),
    );
  }
}
