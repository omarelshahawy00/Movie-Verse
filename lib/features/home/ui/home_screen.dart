import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/manager/all_movies_cubit/all_movies_cubit.dart';
import 'package:movie_app/features/home/manager/trending_movies_cubit/trending_movie_cubit.dart';
import 'package:movie_app/features/home/ui/widgets/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<TrendingMovieCubit>(context).fetchTrendingMovies();
    BlocProvider.of<AllMoviesCubit>(context).fetchMovies(null);
    return const SafeArea(
      child: Scaffold(
        body: HomeScreenBody(),
      ),
    );
  }
}
