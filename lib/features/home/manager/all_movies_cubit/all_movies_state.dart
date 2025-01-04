part of 'all_movies_cubit.dart';

sealed class AllMoviesState extends Equatable {
  const AllMoviesState();

  @override
  List<Object> get props => [];
}

final class AllMoviesInitial extends AllMoviesState {}

final class AllMoviesLoading extends AllMoviesState {}

final class AllMoviesSuccess extends AllMoviesState {
  final List<MovieModel> movie;

  const AllMoviesSuccess(this.movie);
}

final class AllMoviesFailure extends AllMoviesState {
  final String errMessage;

  const AllMoviesFailure(this.errMessage);
}
