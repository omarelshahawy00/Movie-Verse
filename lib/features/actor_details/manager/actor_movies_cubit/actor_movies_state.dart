part of 'actor_movies_cubit.dart';

class ActorMoviesState {}

final class ActorMoviesInitial extends ActorMoviesState {}

final class ActorMoviesLoading extends ActorMoviesState {}

final class ActorMoviesSuccess extends ActorMoviesState {
  final List<MovieModel> actorMovies;

  ActorMoviesSuccess(this.actorMovies);
}

final class ActorMoviesFailure extends ActorMoviesState {
  final String message;

  ActorMoviesFailure(this.message);
}
