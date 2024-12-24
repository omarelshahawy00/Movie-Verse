import 'package:movie_app/features/actor_details/data/model/actor_model.dart';
import 'package:movie_app/features/actor_details/data/model/actor_movies_model.dart';

abstract class ActorRepo {
  Future<ActorModel> getActorDetails(int personId);
  Future<List<ActorMoviesModel>> getActorMovies(int personId);
}
