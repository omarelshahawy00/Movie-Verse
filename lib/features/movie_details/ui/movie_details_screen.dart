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
  const MovieDetailsScreen({super.key, required this.movie});
  final MovieModel movie;
  // final SearchModel search;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CastCubit>(context).fetchCastData(movie.id);
    BlocProvider.of<TrailerCubit>(context).fetchTrailerData(movie.id);
    return MovieDetailsScreenBody(
      movie: movie,
    );
  }
}
