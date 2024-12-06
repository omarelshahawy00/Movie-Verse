import 'package:equatable/equatable.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';

sealed class TrendingMovieState extends Equatable {
  const TrendingMovieState();

  @override
  List<Object> get props => [];
}

final class TrendingMovieInitial extends TrendingMovieState {}

final class TrendingMovieLoading extends TrendingMovieState {}

final class TrendingMovieSuccess extends TrendingMovieState {
  final List<MovieModel> movies;

  const TrendingMovieSuccess(this.movies);
}

final class TrendingMovieFailure extends TrendingMovieState {
  final String errMessage;

  const TrendingMovieFailure(this.errMessage);
}
