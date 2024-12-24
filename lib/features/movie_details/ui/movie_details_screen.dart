import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/helpers/get_it.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';
import 'package:movie_app/features/movie_details/data/repos/details_repo_impl.dart';
import 'package:movie_app/features/movie_details/manager/cast_cubit/cast_cubit.dart';
import 'package:movie_app/features/movie_details/manager/trailer/trailer_cubit.dart';
import 'package:movie_app/features/movie_details/ui/widgets/movie_details_screen_body.dart';
import 'package:movie_app/features/search/data/models/search_model.dart';
import 'package:movie_app/features/search/data/repo/search_repo_impl.dart';
import 'package:movie_app/features/search/manager/cubit/search_cubit.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen(
      {super.key, required this.movie, required this.search});
  final MovieModel movie;
  final SearchModel search;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              CastCubit(getIt.get<DetailsRepoImpl>())..fetchCastData(movie.id),
        ),
        BlocProvider(
          create: (context) => TrailerCubit(getIt.get<DetailsRepoImpl>())
            ..fetchTrailerData(movie.id),
        ),
      ],
      child: MovieDetailsScreenBody(
        search: search,
        movie: movie,
      ),
    );
  }
}
