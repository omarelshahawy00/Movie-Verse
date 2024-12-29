import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';
import 'package:movie_app/features/movie_details/manager/cast_cubit/cast_cubit.dart';
import 'package:movie_app/features/movie_details/manager/trailer/trailer_cubit.dart';
import 'package:movie_app/features/movie_details/ui/widgets/movie_details_screen_body.dart';

class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({super.key, required this.movie});
  final MovieModel movie;

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  @override
  void initState() {
    BlocProvider.of<CastCubit>(context).fetchCastData(widget.movie.id);
    BlocProvider.of<TrailerCubit>(context).fetchTrailerData(widget.movie.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MovieDetailsScreenBody(
      movie: widget.movie,
    );
  }
}
