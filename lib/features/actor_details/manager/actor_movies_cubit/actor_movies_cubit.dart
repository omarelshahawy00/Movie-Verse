import 'package:bloc/bloc.dart';
import 'package:movie_app/features/actor_details/data/model/actor_movies_model.dart';
import 'package:movie_app/features/actor_details/data/repo/actor_repo_impl.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';

part 'actor_movies_state.dart';

class ActorMoviesCubit extends Cubit<ActorMoviesState> {
  ActorMoviesCubit(this.actorRepoImpl) : super(ActorMoviesInitial());
  final ActorRepoImpl actorRepoImpl;
  List<MovieModel> actorMovies = [];
  List<MovieModel> fetchActorMovies(int? personId) {
    emit(ActorMoviesLoading());
    actorRepoImpl.getActorMovies(personId!).then(
      (actorMovies) {
        emit(ActorMoviesSuccess(actorMovies));
        return this.actorMovies = actorMovies;
      },
    ).catchError((e) {
      emit(ActorMoviesFailure(e.toString()));
    });
    return actorMovies;
  }
}
