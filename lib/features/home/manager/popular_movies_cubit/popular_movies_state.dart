part of 'popular_movies_cubit.dart';

sealed class PopularMoviesState extends Equatable {
  const PopularMoviesState();

  @override
  List<Object> get props => [];
}

final class PopularMoviesInitial extends PopularMoviesState {}

final class PopularMoviesLoading extends PopularMoviesState {}

final class PopularMoviesSuccess extends PopularMoviesState {
  final List<MovieModel> movies;

  const PopularMoviesSuccess(this.movies);
}

final class PopularMoviesFailure extends PopularMoviesState {
  final String errMessage;

  const PopularMoviesFailure(this.errMessage);
}
